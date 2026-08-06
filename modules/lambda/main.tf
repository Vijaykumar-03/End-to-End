resource "aws_iam_role" "lambda" {

  name = "lambda-role"

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

}

resource "aws_iam_role_policy_attachment" "basic" {

  role = aws_iam_role.lambda.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}

resource "aws_lambda_function" "lambda" {

  function_name = "user-registration"

  filename = "${path.root}/lambda/lambda.zip"

  handler = "lambda.lambda_handler"

  runtime = "python3.12"

  role = aws_iam_role.lambda.arn

}
