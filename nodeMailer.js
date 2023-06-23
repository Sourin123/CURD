"use strict";
const nodemailer = require("nodemailer");
const transporter = nodemailer.createTransport({
    host: 'smtp.ethereal.email',
    port: 587,
    auth: {
        user: 'hattie26@ethereal.email',
        pass: 'jyBpx92CHPdQ1SaFtv'
    }
});


module.exports = transporter;