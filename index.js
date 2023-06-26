// const mailer = require(__dirname+"/nodeMailer");
const express = require("express");
const app = express();
const port = process.env.PORT||3000;
const database = require(__dirname+"/database");
const bodyParer = require('body-parser')
const sessions = require('express-session');
const router = express.Router();
const { name } = require("ejs");
const cookieParser = require("cookie-parser");
const { redirect, cookie } = require("express/lib/response");
app.use( express.static(__dirname+"public" ) );
const nodemailer = require("nodemailer");
const crypto = require('crypto');
const { flatten } = require("express/lib/utils");
const { ifError } = require("assert");

const transpoter = nodemailer.createTransport({
    service : "gmail",
    auth : {
        user : "testu0292@gmail.com",
        pass : "ljykkbtmyliprbfz"
    }
});
function mailing(toUser, subjectString , textString) {
let mailoption = {
    from : 'admin<testu0292@gmail.com>',
    to : toUser,
    subject : subjectString,
    text :textString
}   

transpoter.sendMail(mailoption , function(err,info){
    if (err) {
        console.log(err);
    }
    console.log('email is send ... ' + info.response);
});
}



function generateRandomString(length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&';
  let randomString = '';
  

  for (let i = 0; i < length; i++) {
    const randomIndex = crypto.randomInt(0, characters.length);
    randomString += characters.charAt(randomIndex);
  }

  return randomString;
}

function generateRandomint(length) {
  const characters = '0123456789';
  let randomString = '';
  

  for (let i = 0; i < length; i++) {
    const randomIndex = crypto.randomInt(0, characters.length);
    randomString += characters.charAt(randomIndex);
  }

  return randomString;
}
// Example usage



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

let adminToken = false ;





//Source: https://stackoverflow.com/questions/17755147
app.get('/',(req,res)=>res.render(__dirname+"/public/welcome_page/index.ejs"));
app.get('/home', function(req, res, next) {
  if (req.session.loggedin == true) {
	res.render(__dirname+"/public/index.ejs" , {token : true});
	
  } else {
	res.render(__dirname+"/public/index.ejs" , {token : false});
  }
});

app.get('/admin_login', function(req,res,next){
    res.render(__dirname+'/public/login/admin_login.ejs');
});

app.get('/logout',function(req,res,next){
  adminToken = false ;
res.redirect('/admin') });
app.post('/admin_login' , function(req,res,next){
  var username = req.body.u ; 
  var password  = req.body.p;

  
  database.query('select * from admin where Admin_name = ? and Admin_pass = ? ;',[username , password],function(err ,rows){
    if (err) {
      console.log(err);

    }
    else{
      adminToken = true ; 
      res.redirect('/admin');
    }
  });
});

app.get('/admin', function(req, res, next) {
   if (adminToken != true) {
     res.redirect('/admin_login');
   }  
  else{
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

            });}
      
      
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

app.get('/doctor_login',(req,res)=> res.render(__dirname+"/public/login/doctor.ejs"));
 let docToken = false;
app.post('/doctor_login',function(req,res,next){
  var doc_id =req.body.doc_id;
  // var password = req.body.password;
  database.query('select * from doctor where doc_id = ?',[doc_id],function(err,rows,next){
    if (err) {
      console.log(err);
      res.send('<h1>Theres ome error </h1> ');
    }
    else
    {
      let data = Object.values(JSON.parse(JSON.stringify(rows)));
      // res.cookie('docDetail', data);
     
      // req.session.docToken = true;
      docToken = true;
      console.log(data[0]);
      res.redirect('/doc_dashbord?doc_id='+doc_id+'&doc_name='+data[0].doc_name);
    }
  });
});

app.get('/doc_dashbord',function(req,res,next){
  if(docToken = false){
    res.redirect('/doctor_login');
  }
  else{
    var doc_name = req.query.doc_name;
    var doc_id = req.query.doc_id;
    // console.log(doc_id)
    database.query('SELECT * FROM `doctor` WHERE doc_id = ?',[doc_id],function(err,result1){
      let rows = Object.values(JSON.parse(JSON.stringify(result1)));
      database.query('select * from booking where doc_name = ?',[rows[0].doc_name],function(err,result2){
        res.render(__dirname + "/public/profile/doctorProfile.ejs",{ data : result1, userData : result2 });
      });
    });
    
  }
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
  var dob = req.body.dob;
  var email= req.body.email;
  var mobile = req.body.Mobile;
  var H_no = req.body.H_no;
  var add1 = req.body.add1;
  var add2 = req.body.add2;
  var pin = req.body.pin;
  var Addrrss = H_no+","+add1+" State: "+add2+"  P.I.N. :"+pin;
  var password = generateRandomString(15);
  var username = F_name+'@'+generateRandomint(4);
  
  

database.query('INSERT INTO `user` ( `F_name`, `L_name`, `email`, `Address`, `Country`, `password`, `Gender`, `username`,`mobile_no`,`dob`) VALUES (?,?,?,?,?,?,?,?,?,?);',[F_name,L_name,email,Addrrss,Country,password,Gender,username,mobile,dob], (err,results,fields)=>{
if (err) {
  return console.log(err);
}
var SubjectString = 'user detail';
var textString = 'welcome user , \n This your user detail '+F_name+' '+L_name+' please put this detail in login page to login out website \n  Your Username is : '+username+ ' and Your Password is :'+ password +'  And Your user id you will find it in your profile page '+'\n thanks for visiting our website' ;

mailing(email ,SubjectString , textString );
res.redirect('/home');
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
  var email = req.body.email ;


  database.query('INSERT INTO `booking` (`user_name`, `doc_name`, `dept_name`, `appontment_date`,`user_email`) VALUES (?,?,?,?,?);',[full_name,doctor,department,date, email], (err,results,fields)=>{
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
app.post('/forget_pass',function(req,res,next){
 var email = req.body.email;
 database.query('select * from user where email = ?',[email],function(error, result){
  if (error) {
    console.log(error);
  }
  let rows = Object.values(JSON.parse(JSON.stringify(result)));
  // rows.forEach((v) => console.log(v));
  // console.log(rows[0].password)
  // mailer.sendMail({
  //   from: '"admin" <admin@example.com>', // sender address
  //   to: email, // list of receivers
  //   subject: "Hear is your pasword", // Subject line
  //   text: "your password is "+rows[0].password, // plain text body
  //   html: "<b>Hello world?</b>", // html body
  // });
  var SubjectString  = " your Password" ;
 var  PasswordString = "your forgotten password is  : " + rows[0].password + " Please Try to Remember it "  ;
 console.log(rows[0].password)
 mailing(email , SubjectString, PasswordString );
 res.redirect('/signin');
 });
 
 });


app.listen(port, function () {
    console.log("it is running in port no ", port );
  });