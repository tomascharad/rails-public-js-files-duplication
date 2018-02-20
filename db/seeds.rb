# settings
[
  {code: 'mainColor', value: '#0078c2'},
  {code: 'courtName', value: 'Tribunal Genérico'},
  {code: 'courtCode', value: '1TER'}, # '2TER, TRIC'
  {code: 'notificationsEmail', value: 'no-contestar@tcit.cl'},
  {code: 'demoBriefId', value: 1673},
  {code: 'demoCauseId', value: 49},
  # {code: 'mainLogo', value: 'http://subinterior.gob.cl/media/2014/09/bg_gob_logo-690x250.png'},
  {code: 'mainLogo', value: 'http://subinterior.gob.cl/media/2014/09/bg_gob_logo-690x250.png'},
  {code: 'loadingLogo', value: 'http://subinterior.gob.cl/media/2014/09/bg_gob_logo-690x250.png'},
  {code: 'stamp', value: 'http://subinterior.gob.cl/media/2014/09/bg_gob_logo-690x250.png'},
  {code: 'blockChilean', value: 'NO'},
  {code: 'chileanShieldLogo', value: 'https://s3-us-west-2.amazonaws.com/vote-grader-case-management/escudo-act.jpg'},
  {code: 'blockLogin', value: 'NO'},
  {code: 'publicDocumentIndex', value: 'true'}
].each do |setting|
  Setting.create(setting)
end

CauseRole.create(name:'Reclamo Padrón Extranjeros', code: 'VRR', letter: 'R')


# (Entity.create name:"Secretario CU", tax_number:"555555555", email:"secretario@email.com").create_secretary
# (Entity.create name:"Ministro CU", tax_number:"999999999").create_minister
# (Entity.create name:"Abogado CU", tax_number:"444444444").create_lawyer
# (Entity.create name:"Relator CU", tax_number:"666666666").create_teller
User.create(email:"aldo@tcit.cl", password:"aldo1234")

[
  'Admisibilidad/Inadmisibilidad',
  'Resoluciones de acuerdo',
  'Designa redactor',
  'Sentencia',
  'Recibe la causa a prueba',
  'Acta de instalación'
].each do |name|
  DocumentCategory.create(name:name)
end

# User.create(email:"tomas@tcit.cl", password:"tomas1234")
# User.create(email:"elopez@tribunalcalificador.cl", password:"elimar1234")
# User.create(email:"alagos@tribunalcalificador.cl", password:"arturo1234")
# User.create(email:"feliperodriguezarteaga@gmail.com", password:"felipe1234")
User.create(email:"aldo@tcit.cl", password:"aldo1234")

secretario = Entity.create(name:'Secretario', email: 'secretario@tcit.cl', tax_number:'555555555')
#secretario = Entity.create(name:'Secretario', email: 'secretario@gmail.com', tax_number:'11790236-6')
Secretary.create(entity_id: secretario.id)
EntityUser.create(uid: secretario.id, password: 'secretario1234')

relator = Entity.create(name:'Relator', email: 'relator@tcit.cl', tax_number:'222222222')
#relator = Entity.create(name:'Relator', email: 'relator@gmail.com', tax_number:'12170029-8')
Teller.create(entity_id: relator.id)
EntityUser.create(uid: relator.id, password: 'relator1234')

lawyer = Entity.create(name:'Abogado', email: 'abogado@tcit.cl', tax_number:'444444444')
Lawyer.create(entity_id: lawyer.id)
EntityUser.create(uid: lawyer.id, password: 'abogado1234')

consul = Entity.create(name:'Consul', email: 'consul@tcit.cl', tax_number:'666666666')
Consul.create(entity_id: consul.id)
EntityUser.create(uid: consul.id, password: 'consul1234')

p "Seed success"