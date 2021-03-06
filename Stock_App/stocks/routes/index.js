var express = require('express');
var router = express.Router();
var PDFDocument = require('pdfkit');
var orm = require('orm');
var mysql = require('mysql');
const User = require('../core/user');
//multer object creation
var multer = require('multer')
var options = {
  userPassword: "123456",
}

function getMySQLConnection() {
  return mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Monu@1234',
    database: 'dbnews'
  });
}


router.use(orm.express("mysql://root:Monu@1234@localhost/dbnews", {
  define: function (db, models, next) {
    models.news = db.define("tbl_posts", {
      id: Number,
      title: String,
      detail: String,
      author_name: String,
      link: String,
      publish_date: { type: 'date', time: false },
      flg: String,
      phone: String,
      image: String,
      comment: String,
      will_modified: Number
    });
    next();
  }
}));

router.get('/', function (req, res, next) {
    res.render('home_page', { title: 'Digital Will' });
  });
router.get('/login_page', function (req, res, next) {
    res.render('login_page', { title: 'Digital Will' });
  });

router.get('/index', function (req, res, next) {
  var result = req.models.news.find({
  }, function (error, news) {
    if (error) throw error;
    res.render('index', { news: news, title: 'Generate Your Digital Will' });
  });
});

router.get('/pdf', function (req, res, next) {
  var id = req.query.id;
  const doc = new PDFDocument(options);
  var result = req.models.news.find({ id: id }, function (error, newspost) {
    if (error) throw error;

    var title = newspost[0]['title'];
    var content = newspost[0]['detail'];
    var publish_date = newspost[0]['publish_date'];
    var author_name = newspost[0]['author_name'];
    var link = newspost[0]['link'];
    var phone = newspost[0]['phone'];
    var comment = newspost[0]['comment'];
    var will_modified = newspost[0]['will_modified'];

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
      .text("Author: " + author_name);
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
      .text("Signature of Testator : " + author_name)
      .text("Declaration of Date : " + publish_date)
      .text("Phone : " + phone);
    doc.moveDown();
    doc.text("Signature of Witnesses: This is system generate Documents no Signature Required ", {
      width: 410,
      align: 'right'
    })
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
      id: Number,
      title: String,
      detail: String,
      author_name: String,
      link: String,
      publish_date: { type: 'date', time: false },
      flg: String,
      comment: String,
      will_modified: Number
    });
    next();
  }
}));
router.get('/modify', (req, res) => {
  res.render('modify', { title: "Digital Assets Will Modification" });
});

router.post('/mod', function (req, res, next) {
  // Connect to MySQL database.
  var connection = getMySQLConnection();
  connection.connect();
  counter: Number;
  const counter = 0;
  const counter_num = 0;
  const Stock_Name = req.body.Stock_Name;
  let Quantity = req.body.Quantity;
  const account = req.body.account;
  createdDate = new Date();
  
  connection.query('select Stock_Name from stocks_main where  Stock_Name = ?', [Stock_Name],
    (error, results) => {
      if (error) {
        res.render('error');
        throw error
      }
      Object.keys(results).forEach(function (key) {
        var row = results[key];
        console.log(row.will_modified + 1);
        
        const counter_num = row.will_modified + 1;
        connection.query('UPDATE stocks_main SET Quantity = ? , account = ? , date_made = ? WHERE Stock_Name = ?', [Quantity, account, createdDate,  Stock_Name],

          (error, results) => {
            if (error) {
              throw error
            }
            else {
              res.render('record_successfull', { title: "Record updated" });
            }
          }

        )
      })
    });


});

router.post('/inst', function (req, res, next) {
  // Connect to MySQL database.
  var connection = getMySQLConnection();
  connection.connect();
  
  const Stock_Name = req.body.Stock_Name;
  let Quantity = req.body.Quantity;
  const account = req.body.account;
  const Stock_Price = req.body.Stock_Price;
  const createdDate = new Date();
 
        
        connection.query('INSERT INTO `stocks_main` (`Stock_Name`, `Quantity`, `account`, `Per_Unit_Cost`,`date_made` ) VALUES (?,?,?,?,? )',[Stock_Name,Quantity,account,Stock_Price,createdDate]),
        (error, results) => {
          if (error) {
            throw error
          }
          else {
            res.render('record_successfull', { title: "Record updated" });
          }
        }
  
});

router.use(orm.express("mysql://root:Monu@1234@localhost/dbnews", {
  define: function (db, models, next) {
    models.nom = db.define("nominee", {
      nom_id: Number,
      fname: String,
      mname: String,
      ltname: String,
      city: String,
      mobileno: String,
      occupation: String,
      dob: { type: 'date', time: false },
      parent_id: String,
      gender: String,
      id: Number
    });
    next();
  }
}));
router.get('/add_nominee', (req, res) => {
  var result = req.models.nom.find({
  }, function (error, nom) {
    if (error) throw error;
    res.render('add_nominee', { nom: nom });
  });
});


router.use(orm.express("mysql://root:Monu@1234@localhost/dbnews", {
  define: function (db, models, next) {
    models.digi = db.define("digi_assets", {
      digi_id: Number,
      digi_name: String,
      digi_mod_date: { type: 'date', time: false },
      digi_type: String,
      digi_parent_id: Number,
      value: Number,
      percentage_share: Number

    });
    next();
  }
}));
router.get('/digital_assets_main', (req, res) => {
  var result = req.models.digi.find({
  }, function (error, digi) {
    if (error) throw error;
    res.render('digital_assets_main', { digi:digi });

  });
});

router.get('/add_nom', (req, res) => {
  res.render('add_nom', { title: "Nominee for Digital Assets" });
});

router.post('/add_nom', function (req, res, next) {
  // Connect to MySQL database.
  var connection = getMySQLConnection();
  connection.connect();
  counter: Number;
  const counter = 0;
  const counter_num = 0;
  const Main_account_id = req.body.Main_account_id;
  let fname = req.body.fname;
  const mname = req.body.mname;
  const ltname = req.body.ltname;
  const createdDate = new Date();
  const city = req.body.city;
  const mobileno = req.body.mobileno;
  const occupation = req.body.occupation;
  const dob = new Date();
  const parent_id = req.body.occupation;
  const gender  = req.body.gender;
  connection.query('select will_modified from tbl_posts where  id = ?', [Main_account_id],
    (error, results) => {
      if (error) {
          res.render('error');
          throw error
      }
      Object.keys(results).forEach(function (key) {
        var row = results[key];
        console.log(row.will_modified + 1);
        const p_id = Main_account_id;
        const counter_num = row.will_modified + 1;
        const comments = 'Nominee Added';
        console.log("before update");
        
        connection.query('INSERT INTO `nominee` (`fname`, `mname`, `ltname`, `city`, `mobileno`,`occupation`,`dob`,`parent_id`,`gender`,created_date ) VALUES (?,?,?,?,?,?,?,?,?,? )',[fname,mname,ltname,city,mobileno,occupation,dob,p_id,gender,createdDate]),
        console.log("after update");
        connection.query('UPDATE tbl_posts SET will_modified = ?,comment = ? WHERE id = ?', [counter_num, comments,p_id]),
        (error, results) => {
            if (error) {
              console.log("after update"); 
              throw error
            }
            else {
              console.log("after update"); 
              res.render('record_successfull', { title: "Record updated" });
            }
          }

              
      })
      
    });

  
});

router.use(orm.express("mysql://root:Monu@1234@localhost/dbnews", {
  define: function (db, models, next) {
    models.stock = db.define("stocks_main", {
      Stock_Name: String,
      Live_Price: String,
      Quantity: Number,
      Per_Unit_Cost: Number,
      status: String,
      account: String
    });
    next();
  }
}));
router.get('/show_stocks', (req, res) => {
  var result = req.models.stock.find({
  }, function (error, stock) {
    if (error) throw error;
    res.render('show_stocks', { stock:stock });

  });
});
router.get('/show_stocks', (req, res) => {
  res.render('show_stocks', { title: "stock_digi Assets" });
});

router.get('/add_digi', (req, res) => {
  res.render('add_digi', { title: "Add Digital Assets" });
});

router.post('/add_digi', function (req, res, next) {
  // Connect to MySQL database.
  var connection = getMySQLConnection();
  connection.connect();
  counter: Number;
  const counter = 0;
  const counter_num = 0;
  const Main_account_id = req.body.Main_account_id;
  const digi_name = req.body.digi_name;
  const digi_type = req.body.digi_type;
  const value = req.body.digi_value;
  const digi_perce = req.body.digi_perce;
  const digi_mod_date = new Date();
  
  connection.query('select nom_id from nominee where  nom_id = ?', [Main_account_id],
  (error, results) => {
    if (error) {
      
      throw error
    }
    Object.keys(results).forEach(function (key) {
      var row = results[key];
      const nom_num = row.nom_id;
      
      
        connection.query('select will_modified from tbl_posts where  id = ?', [Main_account_id],
         (error, results) => {
          if (error) {
        
          throw error
      }
      Object.keys(results).forEach(function (key) {
        var row = results[key];
        console.log(row.will_modified + 1);
        const p_id = Main_account_id;
        const counter_num = row.will_modified + 1;
        const comments = 'Digital assets Added';
        console.log(nom_num);
        console.log(value);
        console.log("before update");
        connection.query('INSERT INTO `digi_assets` (`digi_name`, `digi_mod_date`, `digi_type`, `value`,`digi_parent_id`,nom_id,id,percentage_share) VALUES (?,?,?,?,?,?,?,?)',[digi_name,digi_mod_date,digi_type,value,p_id,nom_num,nom_num,digi_perce]),
        console.log("after update");
        connection.query('UPDATE tbl_posts SET will_modified = ?,comment = ? WHERE id = ?', [counter_num, comments,p_id]),
        (error, results) => {
            if (error) {
              console.log("after update"); 
              throw error
              
            }
            else {
              console.log("after update"); 
              
              
              res.render('record_successfull', { title: "Record updated" });
            }
          }

        })
      })   
      })
      
    });

  
});
const user = new User();
// Post login data
router.post('/login', (req, res, next) => {
  // The data sent from the user are stored in the req.body object.
  // call our login function and it will return the result(the user data).
  user.login(req.body.username, req.body.password, function(result) {
      if(result) {
          // Store the user data in a session.
          
          // redirect the user to the home page.
          res.redirect('/index');
      }else {
          // if the login function returns null send this error message back to the user.
          res.send('Username/Password incorrect!');
      }
  })

});

// Post register data
router.post('/register', (req, res, next) => {
  // prepare an object containing all user inputs.
  let userInput = {
      username: req.body.username,
      fullname: req.body.fullname,
      password: req.body.password
  };
  // call create function. to create a new user. if there is no error this function will return it's id.
  user.create(userInput, function(lastId) {
      // if the creation of the user goes well we should get an integer (id of the inserted user)
      if(lastId) {
          // Get the user data by it's id. and store it in a session.
          user.find(lastId, function(result) {
            
              res.redirect('/login_page');
          });

      }else {
          console.log('Error creating a new user ...');
      }
  });

});


// Get loggout page
router.get('/loggout', (req, res, next) => {
  // Check if the session is exist
  if(req.session.user) {
      // destroy the session and redirect the user to the index page.
      req.session.destroy(function() {
          res.redirect('/');
      });
  }
});
router.get('/assets_allocation', function (req, res, next) {
  
    var allocationList = [];
  
    // Connect to MySQL database.
    var connection = getMySQLConnection();
    connection.connect();
    
    // Do the query to get data.
    connection.query('SELECT a.digi_id,a.digi_name,a.digi_type,a.percentage_share,b.fname,mname,b.ltname,b.city,b.mobileno,b.occupation,b.gender FROM digi_assets a,nominee b where a.nom_id=b.nom_id  ',
    function(err, rows) {
        if (err) {
          res.status(500).json({"status_code": 500,"status_message": "internal server error"});
        } else {
          // Loop check on each row
                // Render index.pug page using array 
        res.render('assets_allocation', {"rows": rows});
        }
    });
  });


    // Close the MySQL connection

 
module.exports = router;
