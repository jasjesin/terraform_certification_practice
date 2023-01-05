resource "aws_eip_association" "ec1_ins1_eip1" {
    instance_id = aws_instance.ec2_ins1.id
    allocation_id = aws_eip.eip1.id  
}