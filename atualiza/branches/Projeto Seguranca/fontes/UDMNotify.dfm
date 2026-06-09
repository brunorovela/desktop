object DMNotify: TDMNotify
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 362
  Width = 452
  object IdSMTP: TIdSMTP
    MailAgent = 'mail.unimestre.com'
    Host = 'mail.unimestre.com'
    Password = 'nerdfede'
    SASLMechanisms = <>
    Username = 'no-reply@uninformare.com.br'
    Left = 208
    Top = 184
  end
  object IdUserPassProvider: TIdUserPassProvider
    Username = 'no-reply@uninformare.com.br'
    Password = 'nerdfede'
    Left = 200
    Top = 72
  end
  object IdSASLLogin: TIdSASLLogin
    Left = 96
    Top = 224
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CharSet = 'ISO-8859-1'
    CCList = <>
    ContentType = 'multipart/mixed'
    Encoding = meMIME
    FromList = <
      item
        Name = 'Atualizador do Unimestre'
        Text = 'Atualizador do Unimestre <>'
      end>
    From.Name = 'Atualizador do Unimestre'
    From.Text = 'Atualizador do Unimestre <>'
    Organization = 'Uninformare Inform'#225'tica'
    Recipients = <
      item
        Address = 'atualizacao@unimestre.com'
        Name = 'Atualiza'#231#227'o'
        Text = '"Atualiza'#231#227'o" <atualizacao@unimestre.com>'
        Domain = 'unimestre.com'
        User = 'atualizacao'
      end>
    InReplyTo = '<atualizacao@unimestre.com>'
    ReplyTo = <
      item
        Address = 'atualizacao@uninformare.com.br'
        Name = 'Atualizacao do Unimestre'
        Text = 'Atualizacao do Unimestre <atualizacao@uninformare.com.br>'
        Domain = 'uninformare.com.br'
        User = 'atualizacao'
      end>
    Subject = 
      '[Atualiza do Unimestre] Notifica'#231#227'o de erros na atualiza'#231#227'o do b' +
      'anco de dados'
    Sender.Address = 'no-reply@unimestre.com'
    Sender.Text = 'no-reply@unimestre.com'
    Sender.Domain = 'unimestre.com'
    Sender.User = 'no-reply'
    ConvertPreamble = True
    Left = 272
    Top = 88
  end
  object IdSASLPlain: TIdSASLPlain
    UserPassProvider = IdUserPassProvider
    LoginAs = 'no-reply@uninformare.com.br'
    Left = 120
    Top = 112
  end
end
