const mysql = require("mysql");




const conn = mysql.createConnection({
    host :"localhost",
    port:3306,
    user :"root",
    password:"",
    database:"test",
});

conn.connect(function(error){

    if (error) {
        console.log(error);
    } else {
        console.log('database connect successfully');
    }
});

module.exports = conn;