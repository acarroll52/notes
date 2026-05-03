---
name: email-draft-replies
description: Draft Outlook email replies in Andrew's voice for review only. Save drafts to Outlook Drafts by default, and never send email.
---

# Email Draft Replies

## Purpose

Use this skill when the user wants help drafting an email reply in their own voice.
The goal is to produce a strong draft for review, save it to Outlook Drafts, and never send mail.

## Shared Profile

Read [Andrew Carroll profile](../../profile/andrew-carroll-profile.md) first when the task depends on Andrew's preferences, tone, people, priorities, company context, or escalation rules.

## Hard Rule

- Never send an email on the user's behalf.
- Never call a send-email action.
- Default to creating or updating an Outlook draft in the Drafts folder instead of printing the full draft into chat.
- Only produce draft content in chat when the user explicitly asks to see the text there or when Drafts creation is unavailable.

## Workflow

1. Identify the target thread, message, or scenario.
2. If an Outlook thread or message is available, inspect it first.
3. Check relevant local project notes when they are likely to contain decisions, commitments, dates, or prior discussion that should shape the reply.
4. Check recent related email context, especially sent mail and nearby thread history, to calibrate tone and recover missing factual context.
5. Check recent relevant Teams messages when the topic appears to have been discussed there or when chat context may clarify the latest position.
6. Draft a reply in the user's voice using the strongest grounded context from notes, email, and Teams.
7. Save the draft to Outlook Drafts for review.
8. In chat, give only a short status note, plus any blockers or assumptions the user needs to resolve.

## Sources To Use

Prefer to ground drafts in these sources when relevant:

- the target email thread
- recent nearby emails on the same topic
- recent sent emails for tone calibration
- local project notes and TODO files
- recent Teams messages or chats tied to the topic or people involved

Use judgment and keep the search tight. Pull in only the context that materially improves the reply.

## Voice Profile

Follow the tone guidance in [references/tone-profile.md](references/tone-profile.md).

Default voice:

- concise
- direct
- practical
- polite without extra fluff
- action-oriented

The user usually prefers:

- short paragraphs
- concrete asks
- minimal throat-clearing
- no AI-sounding polish

## Internal vs External

For internal recipients:

- default to very concise
- be comfortable sounding brief
- lead with the answer, correction, or next step

For external recipients:

- still concise, but slightly warmer
- use a short greeting like `Hi [Name],` when appropriate
- keep the body professional and efficient

## Drafting Rules

- Start with the answer or requested action whenever possible.
- Use bullets only when the content is naturally list-shaped.
- Prefer short paragraphs over long blocks.
- Preserve technical precision.
- If a misunderstanding needs correction, correct it plainly and calmly.
- If the user gives only a rough instruction, make reasonable assumptions and draft a usable reply anyway.
- If a key fact is missing and the risk of inventing it is meaningful, state the assumption outside the draft.

## Missing Info Or Needed Decision

If the draft cannot be responsibly completed without input from the user, or the email clearly requires a decision only the user can make:

- still draft as much of the reply as possible in the Outlook draft
- insert a visible marker in the draft using the format `[@Andrew Carroll - ...]`
- place the marker immediately before the sentence, paragraph, or bullet that needs the user's input
- put the actual instruction inside the brackets, not the word `instructions`
- keep the instruction short, specific, and action-oriented

Examples of what to call out:

- missing factual input
- a priority or tradeoff decision
- approval to commit to a date
- a pricing or scope choice
- an escalation or positioning decision

Keep the instruction note brief and actionable. The goal is to make it easy for the user to review the draft, fill the gap, and send it themselves.

Examples:

- `[@Andrew Carroll - confirm whether we should commit to 5/8 here]`
- `[@Andrew Carroll - choose which of the three pricing options to reference]`
- `[@Andrew Carroll - decide whether to escalate this to Josh]`

## Output Format

Default output should be:

1. A short status note confirming the Outlook draft was created or updated
2. A brief note about any blocker, assumption, or decision marker that still needs Andrew's attention

Add a subject line only if:

- the user asks for one
- the thread is missing one
- the email is net-new rather than a reply

If Outlook Drafts creation is unavailable, fall back to:

1. A short one-line note such as `Draft reply:`
2. The draft body in a fenced code block

## Do Not Mimic

Do not copy:

- Outlook mobile footer text
- long signature blocks unless the user asks for them
- accidental mailbox formatting noise

## Good Uses

- `Draft a reply to this email in my voice`
- `Make this email sound more like me`
- `Write a short reply declining this meeting`
- `Draft a response to this supplier asking for pricing and lead time`
- `Reply to this thread and clarify that we are already at 30-second averaging`
- `Draft this reply and flag anything you need me to decide with [@Andrew Carroll - ...]`

## Fallback Behavior

If full context is unavailable, draft from the best available mix of user instructions, notes, email, and Teams, save the draft to Outlook Drafts when possible, and briefly note the main assumption.
