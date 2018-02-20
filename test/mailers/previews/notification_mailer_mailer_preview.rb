class NotificationMailerPreview < ActionMailer::Preview
  # Accessible from http://localhost:3000/rails/mailers/notification_mailer/send_veredict_creation
  def send_veredict_creation
    a.a
    NotificationMailer.send_veredict_creation(Cause.first, Entity.first, Veredict.first, Document.first, 'feliperodriguezarteaga@gmail.com')
  end
end