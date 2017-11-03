const express=require('express');
var app=express();
var router = express.Router();
var AuthenticationModule=require('./Modules/Authentication_Module/index');

router.post('/SignUp',AuthenticationModule.doSignUp);
router.post('/Login',AuthenticationModule.doLogin);

module.exports=router;


