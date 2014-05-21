Tag.create! ['javascript', 'css', 'html', 'jquery'].map { |t| { name: t } }
User.create!(name: 'ann', password_digest: 'pass')
