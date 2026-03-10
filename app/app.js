const express = require("express")
const path = require("path")

const app = express()

app.use(express.static(path.join(__dirname, "public")))

app.get("/", (req,res)=>{
 res.sendFile(path.join(__dirname,"views","index.html"))
})

app.get("/infrastructure",(req,res)=>{
res.send("Infrastructure security monitoring page")
})

app.get("/vulnerability",(req,res)=>{
res.send("Terraform vulnerability scanning page")
})

app.get("/pipeline",(req,res)=>{
res.send("CI/CD pipeline automation page")
})

app.get("/ai",(req,res)=>{
res.send("AI remediation explanation page")
})

app.listen(3000,()=>{
 console.log("Server running on port 3000")
})