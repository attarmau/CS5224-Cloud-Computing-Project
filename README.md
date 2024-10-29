# CS5224 LLM Cloud Computing Project
This project aims to create an agent that queries a Bedrock Agent, with the query logic implemented in a Cargo Lambda Rust function.
https://docs.aws.amazon.com/bedrock/latest/userguide/agents-how.html

<img width="853" alt="Screenshot 2024-10-01 at 10 01 12 AM 1" src="https://github.com/user-attachments/assets/a6b6705d-4ec3-4853-87b4-82c7d1719b98">



Here are the steps that this tool could follow:

1.Define OpenAPI schema for query action

2.Create Lambda to query database

3.Build Lambda with Cargo Lambda

4.Deploy Lambda with Cargo Lambda

5.Add Lambda to agent action group

6.Test agent orchestration and query action


Why does running models locally with llamafile provide better performance?
Avoiding latency delays from external calls
The tokenizer splits text into tokens, but encoding converts the tokens to numbers.

![未命名绘图 drawio](https://github.com/user-attachments/assets/76b6f388-5dd3-4d20-a1a6-bfb16ab90fd9)
