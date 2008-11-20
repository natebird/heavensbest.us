class SubscriptionNotifier < ActionMailer::Base
  include ActionView::Helpers::NumberHelper
  
  def setup_email(to, subject, from = APP_CONFIG['from_email'])
    @sent_on = Time.now
    @subject = subject
    @recipients = to.respond_to?(:email) ? to.email : to
    @from = from.respond_to?(:email) ? from.email : from
  end
 
 # Remove this 
  def welcome(user)
    setup_email(user, "Welcome to #{APP_CONFIG['app_name']}!")
    @body = { :user => user }
  end
  
  def trial_expiring(user, subscription)
    setup_email(user, 'Trial period expiring')
    @body = { :user => user, :subscription => subscription }
  end
  
  def charge_receipt(subscription_payment)
    setup_email(subscription_payment.account.user, "Your #{APP_CONFIG['app_name']} invoice")
    @body = { :subscription => subscription_payment.subscription, :amount => subscription_payment.amount }
  end
  
  def setup_receipt(subscription_payment)
    setup_email(subscription_payment.subscription.account.user, "Your #{APP_CONFIG['app_name']} invoice")
    @body = { :subscription => subscription_payment.subscription, :amount => subscription_payment.amount }
  end
  
  def charge_failure(subscription)
    setup_email(subscription.account.user, "Your #{APP_CONFIG['app_name']} renewal failed")
    @bcc = APP_CONFIG['from_email']
    @body = { :subscription => subscription }    
  end
  
  def plan_changed(subscription)
    setup_email(subscription.account.user, "Your #{APP_CONFIG['app_name']} plan has been changed")
    @body = { :subscription => subscription }    
  end

# Remove this  
  def password_reset(reset)
    setup_email(reset.user, 'Password Reset Request')
    @body = { :reset => reset }
  end
end
