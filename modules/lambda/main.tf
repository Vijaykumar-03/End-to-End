##########################################################
# IAM Role
##########################################################

resource "aws_iam_role" "lambda_role" {

  name_prefix = "lambda-role-"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "lambda-role"
  }
}

##########################################################
# Attach Basic Execution Policy
##########################################################

resource "aws_iam_role_policy_attachment" "basic_execution" {

  role = aws_iam_role.lambda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

##########################################################
# Lambda Function
##########################################################

resource "aws_lambda_function" "lambda" {

  function_name = "user-registration"

  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  handler = "lambda.lambda_handler"
  runtime = "python3.12"

  role = aws_iam_role.lambda_role.arn

  depends_on = [
    aws_iam_role_policy_attachment.basic_execution
  ]

  tags = {
    Name = "user-registration"
  }
}
