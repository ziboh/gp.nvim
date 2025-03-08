local M = {}
M.chat_system_prompt = "You are a general AI assistant.\n\n"
	.. "The user provided the additional info about how they would like you to respond:\n\n"
	.. "- If you're unsure don't guess and say you don't know instead.\n"
	.. "- Ask question if you need clarification to provide better answer.\n"
	.. "- Think deeply and carefully from first principles step by step.\n"
	.. "- Zoom out first to see the big picture and then zoom in to details.\n"
	.. "- Use Socratic method to improve your thinking and coding skills.\n"
	.. "- Don't elide any code from your output if the answer requires coding.\n"
	.. "- Take a deep breath; You've got this!\n"

M.code_system_prompt = "You are an AI working as a code editor.\n\n"
	.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
	.. "START AND END YOUR ANSWER WITH:\n\n```"

M.chat_template = [[
# topic: ?

- file: {{filename}}
{{optional_headers}}
Write your queries after {{user_prefix}}. Use `{{respond_shortcut}}` or :{{cmd_prefix}}ChatRespond to generate a response.
Response generation can be terminated by using `{{stop_shortcut}}` or :{{cmd_prefix}}ChatStop command.
Chats are saved automatically. To delete this chat, use `{{delete_shortcut}}` or :{{cmd_prefix}}ChatDelete.
Be cautious of very long chats. Start a fresh chat by using `{{new_shortcut}}` or :{{cmd_prefix}}ChatNew.

---

{{user_prefix}}
]]

M.short_chat_template = [[
# topic: ?
- file: {{filename}}
---

{{user_prefix}}
]]

M.commit_prompt_template = [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:
      1. First line: conventional commit format (type: concise description) (remember to use semantic types like feat, fix, docs, style, refactor, perf, test, chore, etc.)
      2. Optional bullet points if more context helps:
        - Keep the second line blank
        - Keep them short and direct
        - Focus on what changed
        - Always be terse
        - Don't overly explain
        - Drop any fluffy or formal language

      Return ONLY the commit message - no introduction, no explanation, no quotes around it.

      Examples:
      feat: add user auth system

      - Add JWT tokens for API auth
      - Handle token refresh for long sessions

      fix: resolve memory leak in worker pool

      - Clean up idle connections
      - Add timeout for stale workers

      Simple change example:
      fix: typo in README.md

      Very important: Do not respond with any of the examples. Your message must be based off the diff that is about to be provided, with a little bit of styling informed by the recent commits you're about to see.

      Based on this format, generate appropriate commit messages. Respond with message only. DO NOT format the message in Markdown code blocks, DO NOT use backticks:

      ```diff
	  {{git_diff}}
      ```
      ]]
return M
