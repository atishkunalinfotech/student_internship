class AgentMailer < ActionMailer::Base
  default from: "atishkumarlewate@gmail.com"

  def agent_mail(agent,password)
    @agent = agent
    @password = password
    mail(:to => @agent,
         :subject => "Your account details"
    )
  end


  def agent_staff_mail(agent,password)
    @agent = agent
    @password = password
    mail(:to => @agent,
         :subject => "Your account details"
    )
  end
end