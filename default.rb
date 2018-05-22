
login file


{
"accessKeyId":"your access key",
"secretAccessKey":"secret key",
"httpProxy":"http://one.proxy.att.com:8080",
"httpsProxy":"https://one.proxy.att.com:8080",
"fs.s3a.proxy.host":"one.proxy.att.com",
"fs.s3a.proxy.port":"8080",
"region":"us-east-1",
"userName":"username",
"roleArn":"role arn",
"roleExpireSeconds":"21600",
"kmsKeyArn" : "your key"
}

commands---
aws s3 cp sample.txt s3://bucketname/dl/datalibrary/ --sse aws:kms --sse-kms-key-id (kms key arn) --profile profile-name

aws s3 rm s3://somerandombucket123/1/account/sample.txt --profile profile-name
