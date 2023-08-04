const express = require('express');
const app = express();

const mongoose = require('mongoose');
const Note = require('./models/Note');

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

const mongoosePath = "mongodb+srv://qcind2909:123456789zZ@cluster0.tcrpr5l.mongodb.net/notesdb"
mongoose.connect(mongoosePath).then(function () {

    app.get("/", function (req, res) {
        const response = { statuscode: res.statusCode, message:  "API is work!" };
        res.send(response);


        const noteRouter = require('./routes/Note');
        app.use("/notes", noteRouter);

    });



});



const PORT = process.env.PORT || 5000;
app.listen(PORT, function () {
    console.log("Server started at PORT: " + PORT);
});