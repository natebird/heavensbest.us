class UserMailer < ActionMailer::Base
  default_url_options[:host] = "heavensbest.us"  

  def signup_notification(user)
    setup_email(user)
    @subject << 'Invitation to www.HeavensBest.us'
    @body[:url] = "#{APP_CONFIG[:site_url]}/signup/#{user.activation_code}"
  end
  
  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "HeavensBest.us Website"  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end  
    
  protected
  
  def setup_email(user)
    @recipients = "#{user.email}"
    @from = APP_CONFIG[:admin_email]
    @subject = "[#{APP_CONFIG[:site_name]}] "
    @sent_on = Time.now
    @body[:user] = user
  end
end
