const express = require("express");
const mongoose = require("mongoose");
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Connect to MongoDB
mongoose.connect('mongodb://127.0.0.1:27017/maddb', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch(err => {
    console.error("Failed to connect to MongoDB: " + err);
  });

app.listen(3000, () => {
  console.log("Connected to server at 3000");
});

// Create a model for your product data
const Product = mongoose.model('Product', {
    title:String,
    disc:String,
    price:String
});

app.post("/api/addProduct", async (req, res) => {
    try{
        const newProduct=await Product.create(req.body);
        //200 for success 
        res.status(201).json(newProduct);

    }
    catch(error){
        res.status(500).json({error:error.message});
    }
});

app.get("/api/getProduct", async (req, res) => {
    try{
        const products=await Product.find();
         res.status(201).json(products);
     }
     catch(error){
         res.status(500).json({error:error.message});
     }
  });
