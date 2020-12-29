const express = require("express")
const app = express()
const PORT = process.env.PORT || 1515
require('dotenv').config()
const cookieParser = require("cookie-parser");
const session = require("express-session");
const FileStore = require("session-file-store")(session)

// session
app.use(cookieParser(process.env.SESSION));
app.use(session({
    secret: process.env.SESSION,
    resave: false,
    saveUninitialized: false,
    store: new FileStore({
        path: "/tmp/sessions/",
        useAsync: true
    }),
    cookie: { maxAge: 3600000, secure: false, httpOnly: false }
}))


// post data json 
app.use(express.json())
app.use(express.urlencoded({ extended: false }))

// public file 
app.use(express.static('public'))

app.set('view engine', 'ejs');

app.use("/", require("./app/app"))


// server yoqish 
app.listen(PORT, () => {
    console.log("Create Server " + PORT)
})