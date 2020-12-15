FactoryBot.define do
  factory :user do
    email                 {"test@com"}
    password              {"qwe123"}
    password_confirmation {password}
    nickname              {"武蔵"}
    family_name           {"山本"}
    last_name             {"武蔵"}
    family_name_kana      {"ヤマモト"}
    last_name_kana        {"ムサシ"}
    birthday              {"1990.04.22"}
  end
end