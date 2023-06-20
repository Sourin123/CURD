"use strict";
const nodemailer = require("nodemailer");
const transporter = nodemailer.createTransport({
    host: 'smtp.ethereal.email',
    port: 587,
    auth: {
        user: 'elbert.murray8@ethereal.email',
        pass: 'tU1uJ8WhBSPYMyaypW'
    }
});


module.exports = transporter;