var express     = require('express');
var router      = express.Router();
var PDFDocument = require('pdfkit');
var orm         = require('orm');
var mysql = require('mysql');
//multer object creation
var multer  = require('multer')

function getMySQLConnection() {
	return mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'Monu@1234',
	  database : 'dbnews'
	});
}


router.use(orm.express("mysql://root:Monu@1234@localhost/dbnews", {
  define: function (db, models, next) {
    models.news = db.define("tbl_posts", {
    id           : Number,
    title        : String,
    detail       : String,
    author_name  : String,
    link         : String,
    publish_date : { type: 'date', time: false }, 
    flg          : String,
    phone        : String,
    image        : String,
    comment      : String,
    will_modified: Number
  });
  next();
  }
}));

router.get('/', function(req, res, next) {
  var result = req.models.news.find({
  }, function(error, news){
      if(error) throw error;
      res.render('index', { news:news, title: 'Generate Digital Will' });
  });
});

router.get('/pdf', function(req, res, next) {
  var id  = req.query.id;
  const doc = new PDFDocument();
  var result = req.models.news.find({id: id}, function(error, newspost){
      if(error) throw error;

      var title        = newspost[0]['title'];
      var content      = newspost[0]['detail'];
      var publish_date = newspost[0]['publish_date'];
      var author_name  = newspost[0]['author_name'];
      var link         = newspost[0]['link'];
      var phone        = newspost[0]['phone'];
      var comment      = newspost[0]['comment'];
      var will_modified      = newspost[0]['will_modified'];

      var filename = encodeURIComponent(title) + '.pdf';
      res.setHeader('Content-disposition', 'attachment; filename="' + filename + '"');
      res.setHeader('Content-type', 'application/pdf');
      doc.font('Times-Roman', 18)
        .fontSize(25)
        .text(title, 100, 50);

      doc.fontSize(15)
         .fillColor('blue')
         .text('Read Full Article', 100, 100)
         .link(100, 100, 160, 27, link);
      doc.moveDown()
         .fillColor('red')
         .text("Author: "+author_name);
      doc
         .moveDown()
         .fillColor('black')
         .fontSize(15)
         .text(content, {
           align: 'justify',
           indent: 30,
           height: 300,
           ellipsis: true
         });
         doc.moveDown()
         .fillColor('Black')
         .text("Signature of Testator : "+author_name)
         .text("Declaration of Date : "+publish_date)
         .text("Phone : "+phone);
         doc.moveDown();
         doc.text("Signature of Witnesses: This is system generate Documents no Signature Required ", {
         width: 410,
         align: 'right' })
          doc.moveDown()
         .fillColor('red')
         .text("This is system generate Documents Please read carefully as the Bank is not Liable for any mistake further");
      doc.pipe(res);
      doc.end();
  });

});
router.use(orm.express("mysql://root:Monu@1234@localhost/dbnews", {
  define: function (db, models, next) {
    models.willupdate = db.define("tbl_posts", {
      id           : Number,
      title        : String,
      detail       : String,
    author_name  : String,
    link         : String,
    publish_date : { type: 'date', time: false }, 
    flg          : String,
    comment      : String,
    will_modified :Number
  });
  next();
  }
}));
router.get('/modify', (req, res) => {
  res.render('modify', {title: "Digital Assets"});
});

router.post('/mod', function(req, res, next) {
  // Connect to MySQL database.
	var connection = getMySQLConnection();
	connection.connect();
  counter           : Number;
  const counter = 0 ;
  const counter_num = 0 ;
  const id = req.body.id;
  let comment = req.body.comment;
  const image = req.body.imageupload;
  const phone = req.body.phone;
  createdDate = new Date();
  console.log("RDS id" ,phone );
  console.log(comment );
  connection.query('select will_modified from tbl_posts where  id = ?' ,[id],
  (error, results) => {
    if (error) {
      throw error
          }
          Object.keys(results).forEach(function(key) {
            var row = results[key];
            console.log(row.will_modified + 1);
                     
          const counter_num = row.will_modified + 1;
          connection.query('UPDATE tbl_posts SET comment = ? ,image = ? , phone = ? , publish_date = ?,will_modified = ? WHERE id = ?'  ,[comment,image,phone,createdDate,counter_num,id],
          (error, results) => {
            if (error) {
              throw error
               }
            else {
            res.render('record_successfull', { title: "Record updated"});
            }
          }
          
        )
  })
});
  
  
});


router.get('/add_nominee', (req, res) => {
  res.render('add_nominee', {title: "Nomninee Adding"});
}); 


 

module.exports = router;
