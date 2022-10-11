# frozen_string_literal: true
require "telegram/bot"

TOKEN = "5641299982:AAF6NP_ocBugJqe_RC7_jfXABmY0RHb5UVE"

ANSWERS = [ 
 # Положительные
  'Бесспорно',
  'Предрешено',
  'Никаких сомнений',
  'Определённо да',
  'Можешь быть уверен в этом',

  # Нерешительно положительные
  'Мне кажется — «да»',
  'Вероятнее всего',
  'Хорошие перспективы',
  'Знаки говорят — «да»',
  'Да',

  # Нейтральные
  'Пока не ясно, попробуй снова',
  'Спроси позже',
  'Лучше не рассказывать',
  'Сейчас нельзя предсказать',
  'Сконцентрируйся и спроси опять',

  # Отрицательные
  'Даже не думай',
  'Мой ответ — «нет»',
  'По моим данным — «нет»',
  'Перспективы не очень хорошие',
  'Весьма сомнительно'
]

Telegram::Bot::Client.run(TOKEN) do |bot|
bot.listen do |message|
case message.text
when "/start", "/start start"
	bot.api.send_message(chat_id: message.chat.id
		text: "Hello, #{message.from.first_name}"
		)
else
	bot.api.send_message(
	chat_id: message.chat.id,
	text: ANSWERS.sample)
	end
    end
end
