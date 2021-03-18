json.array! @articles do |article|
  json.id article.id
  json.title article.title
  json.description article.description
  json.image article.image
  json.user_id article.user_id
  json.nickname article.user.nickname
  json.user_sign_in current_user
end