# Copyright 2011-2012 Rice University. Licensed under the Affero General Public 
# License version 3 or later.  See the COPYRIGHT file for details.

class DeveloperNotifier < SiteMailer
  
  def exception_email(exception, user = nil, msg = nil, full_trace = false, request = nil, error_id = nil, email_sent = nil)
    @user = user
    @exception = exception
    @backtrace = full_trace ?
                 exception.backtrace :
                 Rails.backtrace_cleaner.clean(exception.backtrace)
    @msg = msg
    
    @request = request
    @error_id = error_id
    @email_sent = email_sent
    
    subject = user.nil? ? "An exception occurred" : user.username + " encountered an exception"

    mail(:to => User.error_notice_recipients.collect { |a| a.email },
         :subject => subject).deliver(:safe_delivery_disabled => true)
  end

  def custom_email(msg)
    @msg = msg
    mail(:to => User.active_administrators.collect { |a| a.email },
         :subject => "Automated message from #{SITE_NAME}").deliver
  end

end
