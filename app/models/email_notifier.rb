require 'mandrill'

class EmailNotifier
  MANDRILL_SUCCESS_STATUSES = ['sent', 'queued', 'scheduled']

  def initialize(user)
    @user = user
  end

  def send(remembrance)
    begin
      mandrill = Mandrill::API.new
      response = mandrill.messages.send build_message(remembrance)
      log_response(response)
    rescue Exception
      log_error($!)
    rescue StandardError
      log_error($!)
    end
  end

  private

  def message_text(remembrance)
    return <<-EOS.strip_heredoc
    #{remembrance.url}

    #{remembrance.title}

    #{remembrance.preview}

    -----

    If you don't want to get these emails anymore, go to http://madelein.es/settings to change your notification preferences.
    EOS
  end

  def message_html(remembrance)
    return <<-EOS.strip_heredoc
    <a href="#{remembrance.url}">#{remembrance.title}</a>
    <p>#{remembrance.preview}</p>

    <hr />
    <p>If you don't want to get these emails aymore, go to the <a href="http://madeleines.es/settings">Madeleines settings page</a> to change your notification preferences.</p>
    EOS
  end

  def build_message(remembrance)
    return {
      :subject => remembrance.title,
      :text => message_text(remembrance),
      :html => message_html(remembrance),
      :from_email => 'notify@madelein.es',
      :from_name => 'Madeleines',
      :to => [
        {:email => @user.email,
         :type => 'to'}
      ]
    }
  end

  def log_response(response)
    # We only send one message at a time, so assume that we only
    # get one response.
    response = response.first

    if MANDRILL_SUCCESS_STATUSES.include?(response['status']) and
       response['reject_reason'].nil?
      puts "Successfully sent daily email to user #{@user}"
    else
      puts "Mandrill error sending daily email to user #{@user}"
      puts "Mandrill rejection reason: #{response['reject_reason']}"
    end
  end

  def log_error(error)
    puts "Exception thrown while sending daily email to user #{@user}:"
    puts "#{error}"
    puts "\t#{error.backtrace.join("\n\t")}"
  end
end
