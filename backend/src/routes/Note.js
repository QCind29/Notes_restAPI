const express = require('express');
const router = express.Router();

const Note = require('./../models/Note')


router.post("/listBy", async function (req, res) {

    var notes = await Note.find({userid: req.body.userid});
    
    res.json(notes);

});

router.get("/list", async function (req, res) {

    var notes = await Note.find();
    
    res.json(notes);

});

router.post("/add", async function (req, res) {
    const newNote = new Note(
        {
            id: req.body.id,
            userid: req.body.userid,
            title: req.body.title,
            content: req.body.content
        }
    );
    await newNote.save();
    
    const response = {message: "Create complete! " + `id: ${req.body.id} ` };

    res.json(response);

});
router.post ("/delete", async function(req, res){

    await Note.deleteOne({id: req.body.id});
    const response = {message: "delete complete"};
    res.json(response);
});
module.exports = router;