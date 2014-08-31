class PublishMailer < ActionMailer::Base
  default from: 'publisher@nekojarashi.com'

  def publish_amazon(to)
    attachments['index.mobi'] = File.read('tmp/index.mobi')
    mail to: to
  end
end
