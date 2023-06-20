const mailer = require(__dirname+"/nodeMailer");
const express = require("express");
const app = express();
const port = process.env.PORT||3000;
const database = require(__dirname+"/database");
const bodyParer = require('body-parser')
const sessions = require('express-session');
const router = express.Router();
const { name } = require("ejs");
const cookieParser = require("cookie-parser");
const { redirect } = require("express/lib/response");
app.use( express.static(__dirname+"public" ) );
// const commentBox = require('commentbox.io');

// commentBox('5668783830073344-proj');




const oneDay = 1000 * 60 * 60 ;
app.use(sessions({
    secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
    saveUninitialized:true,
    cookie: { maxAge: oneDay },
    resave: false 
}));
app.use(express.json());
// app.use(express.static(static_path));
app.use(bodyParer.json());
app.use(bodyParer.urlencoded({ extended: false }));
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());







//Source: https://stackoverflow.com/questions/17755147
app.get('/',(req,res)=>res.render(__dirname+"/public/welcome_page/index.ejs"));
app.get('/home', function(req, res, next) {
  if (req.session.loggedin == true) {
	res.render(__dirname+"/public/index.ejs" , {token : true});
	
  } else {
	res.render(__dirname+"/public/index.ejs" , {token : false});
  }
});
app.get('/admin', function(req, res, next) {
      var amount ;
      database.query('Select count( `doc_id` ) as number FROM doctor UNION ALL SELECT count( user_id ) FROM user UNION all SELECT COUNT( dept_id ) FROM department UNION all SELECT COUNT( Admin_id ) from admin',function(err , result){
        if (err) {
          console.log(err);
         }
         database.query('SELECT * FROM user',function(err,rows){
          if(err){
                    console.log('error', err); 
          }

        res.render(__dirname+'/public/admin/index.ejs',{ amount : result , data:rows , title:"User Table"});
         });

        });
      
      
  //      {
  
  //        
  //         res.render(__dirname+'/public/admin/fetchtable_user.ejs',{title:"Users - Node.js",data:'',error:err});   
  //        }else{
             
  //            res.render(__dirname+"/public/admin/fetchtable_user.ejs",{title:"Users - Node.js",data:rows});
  //        }
                             
  //         });
         
    } );

     app.get('/doctor',function(req,res,next){
      database.query('select * from doctor,department where doctor.dept_id = department.dept_id; ',function(error,rows){
        if (error) {
          console.log(error);
        
        // console.log(rows)
        res.render(__dirname+'/public/doctors/index.ejs',{title:"Users - Node.js",data:'',error:err , token : true});   
      }else{
          
          res.render(__dirname+"/public/doctors/index.ejs",{title:"Users - Node.js",data:rows, token : false});
      }
       
      });
    });

     app.get("/in",(req,res)=> res.sendFile(__dirname+"/public/data.html"));
app.post("/in", function(req,res){
	var dname = String(req.body.dname);
  var gender = req.body.gender;
  var deperment = req.body.deperment;
  var hospital = req.body.hospital;
  var degree = req.body.degree;
  
	
console.log(dname);
	database.query('INSERT INTO `DOCTOR` ( `DNAME`, `GENDER`, `QUALIFICATION`, `JOB_SPECIFICATION`, `HOSP_NAME`) VALUES(?,?,?,?,?); ',[dname,gender,degree,deperment,hospital], (err,results,fields)=>{
		if (err) {
		  return console.log(err);
		}
		res.sendFile(__dirname+"/public/data.html");
		return console.log(results);
		});


});
let username , password;
app.get("/signin",function(req,res,next){
  if (req.session.loggedin == true) {
     database.query('SELECT * FROM user WHERE username = ? AND password = ?', [username, password], function(err,rows){
      res.render(__dirname+"/public/profile/index.ejs",{data : rows, token : true});
     });
  } else {
    res.render(__dirname+"/public/login/index.ejs");
  }
  
});
app.get('/profile',function(req,res,next){
  if (req.session.loggedin == true) {
     database.query('SELECT * FROM user WHERE username = ? AND password = ?', [username, password], function(err,rows){
      res.render(__dirname+"/public/profile/index.ejs",{data : rows, token : true});
     });
  } else {
    res.render(__dirname+"/public/login/index.ejs");
  }
  
});
app.post('/auth', function(request, response) {
	// Capture the input fields
	username = request.body.username;
	password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		database.query('SELECT * FROM user WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;
			// If the account exists
			if (results.length > 0) {
				// Authenticate the user
				request.session.loggedin = true;
				request.session.username = username;
        database.query('UPDATE `user` SET `isActive` = 1 WHERE username = ?',[username],function(error,res,next){
          if (error) {
            console.log(error);
          }
        });
				// Redirect to home page
				response.redirect('/profile');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});
app.post("/signout" ,function(req,res,next){
	req.session.loggedin = false;
  database.query('UPDATE `user` SET `isActive` = 0 WHERE username = ?',[username],function(error,res,next){
    if (error) {
      console.log(error);
    }
  });
  username = null;
  password = null;

	res.redirect("/home");
});

app.get("/signup",function(req,res,next){
  if (req.session.loggedin == true) {
     res.redirect("/home");
  } else {
    res.render(__dirname+"/public/signup/index.ejs",{token: false});
  }
  
});
app.post("/signup", function(req,res){
  var F_name = String(req.body.F_name);
  var L_name = req.body.L_name;
  var Gender = req.body.Gender;
  var Country = req.body.Country;
  var username = req.body.username;
  var email= req.body.email;
  var mobile = req.body.Mobile;
  var pass1 = req.body.pass1;
  var pass2 = req.body.pass2;
  var H_no = req.body.H_no;
  var add1 = req.body.add1;
  var add2 = req.body.add2;
  var pin = req.body.pin;
  var Addrrss = H_no+","+add1+" State: "+add2+"  P.I.N. :"+pin;
  var password = "";
  if (pass1 == pass2) {
    password = pass1;
  }
  else{
    res.send("passwords are not same");
  }
  

database.query('INSERT INTO `user` ( `F_name`, `L_name`, `email`, `Address`, `Country`, `password`, `Gender`, `username`,`mobile_no`) VALUES (?,?,?,?,?,?,?,?,?);',[F_name,L_name,email,Addrrss,Country,password,Gender,username,mobile], (err,results,fields)=>{
if (err) {
  return console.log(err);
}
res.redirect('/');
return console.log(results);
});

})
app.get('/about',function(req,res){
  if (req.session.loggedin == true) {
    res.render(__dirname+"/public/about/index.ejs" , {token : true});
    
    } else {
    res.render(__dirname+"/public/about/index.ejs" , {token : false});
    }
});


//booking
app.get('/book',function(req,res){
  console.log(req.query.doc);
  let doctor = req.query.doc ;
  let dep = req.query.dep;
  if (req.session.loggedin == true) {
    res.render(__dirname+"/public/book/index.ejs" , {token : true , doctor : doctor , department : dep});
    
    } else {
    res.render(__dirname+"/public/book/index.ejs" , {token : false , doctor : doctor , department : dep});
    }
});

app.post('/book',function(req,res,next){
  var full_name = req.body.name;
  // var ph_no = req.body.phone;
  var doctor = req.body.doctor;
  var department = req.body.department;
  var date = req.body.date;


  database.query('INSERT INTO `booking` (`user_name`, `doc_name`, `dept_name`, `appontment_date`) VALUES (?,?,?,?);',[full_name,doctor,department,date], (err,results,fields)=>{
    if(err) {
     return console.log(err)
    }
    res.redirect('/home');
    return console.log(results);
  });
  

});

app.get('/contact_us',function(req,res){
  if (req.session.loggedin == true) {
    res.render(__dirname+"/public/contect_us/index.ejs" , {token : true});
    
    } else {
    res.render(__dirname+"/public/contect_us/index.ejs" , {token : false});
    }
});


app.get('/deperment',function(req,res,next){
  database.query('select * from department ;',function(error,rows){
    if (error) {
      console.log(error);
    } 
    // console.log(rows)
    if (req.session.loggedin == true) {
      res.render(__dirname+"/public/deperment/index.ejs",{data : rows, token : true});
      
      } else {
      res.render(__dirname+"/public/deperment/index.ejs",{data : rows, token : false});
      }
  });
});
app.get('/subcription',(req,res)=> res.render('./public/subcripsion/index.ejs'));


app.get('/forget_pass',(req,res)=> res.render(__dirname+'/public/common/forgot.ejs'));


app.listen(port, function () {
    console.log("it is running in port no ", port );
  });