#r53.tf

resource "aws_route53_zone" "kkmn-hostedzone" {
  name = "kkmn.info"

  tags = {
    Environment = "dev"
  }
}



resource "aws_route53_record" "apache2" {
  zone_id = aws_route53_zone.kkmn-hostedzone.zone_id
  name    = "apache2.kkmn.info"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.nateip.public_ip]
}