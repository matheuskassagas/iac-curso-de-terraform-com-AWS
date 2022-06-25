resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}" #interpolacao
  #cinco palavras randomicas separada por - + dev
  tags = local.common_tags #local (plural)
}

resource "aws_s3_bucket_object" "this" {
  bucket = aws_s3_bucket.this.bucket     #.bucket variavel 
  key    = "config/${local.ip_filepath}" #key is where I want to save de file into the bucket
  source = "ips.json"                    #path, how already it is in the pasta we just put the file name
  etag   = filemd5(local.ip_filepath)    #interpolacao 
  #etag   = filemd5("ips.json")       #identifica quando o conteudo foi alterado
}


