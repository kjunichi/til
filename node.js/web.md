# DB sample

```js
const fs = require('fs');
const pg = require('pg');
const conString = "postgres://kjunichi@kjunichi.local/kjunichi";

const express = require('express');
const app = express();
const client = new pg.Client(conString);

app.get('/', (req, res) => {
    pg.connect(conString, (err, client, done) => {
      var handleError = function(err) {
      // no error occurred, continue with the request
      if(!err) return false;

      // An error occurred, remove the client from the connection pool.
      // A truthy value passed to done will remove the connection from the pool
      // instead of simply returning it to be reused.
      // In this case, if we have successfully received a client (truthy)
      // then it will be removed from the pool.
      if(client){
        done(client);
      }
      res.writeHead(500, {'content-type': 'text/plain'});
      res.end('An error occurred');
      return true;
    };
        if (err) {
            return console.error('error fetching client from pool', err);
        }
        client.query('SELECT NOW() AS "theTime"', (err, result) => {
            done();
            if (err) {
                return console.error('error running query', err);
            }
            console.log(result.rows[0].theTime);


            let page = parseInt(req.query.page);
            if(!page) {
              page=1;
            }
        let content="";
        for(let i=page; i < page+20; i++) {
          content=content+`<li><img src="/img?id=${i}"></li>`;
        }
        res.send(result.rows[0].theTime+"<br><ul>"+content+"</ul>");
        //output: Tue Jan 15 2013 19:12:47 GMT-600 (CST)
        //client.end();
      });
    });
});
app.get('/img', (req, res) => {
    pg.connect(conString, function(err, client, done) {
      const handleError = (err) => {
      // no error occurred, continue with the request
      if(!err) return false;

      if(client){
        done(client);
      }
      res.writeHead(500, {'content-type': 'text/plain'});
      res.end('An error occurred');
      return true;
    };
        if(handleError(err)) return;
        client.query('SELECT data AS "data" from image_test i where i.id=$1', [req.query.id], (err, result) => {
           if(handleError(err)) return;
            done();

            if(result.rows)
            console.log(req.query.id + " : OK");
            res.set('Content-Type', 'image/jpeg');
            res.send(result.rows[0].data);
        });
    });
});

app.listen(3000, function() {
    console.log('Example app listening on port 3000!');
});
```
