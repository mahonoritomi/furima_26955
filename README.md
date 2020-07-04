# テーブル設計

## usersテーブル
|  column | type | options |
| --- | --- | --- |
|  nickname | string | null: false |
|  email | string | null: false |
|  password | string | null: false |
|  password_confirmation | string | null: false |
|  first_name | string | null: false |
|  family_name | string | null: false |
|  first_name_kana | string | null: false |
|  family_name_kana | string | null: false |
|  birth_year | integer | null: false |
|  birth_month | integer | null: false |
|  birth_day | integer | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :comments


## itemsテーブル
|  column | type | options |
| --- | --- | --- |
|  image | string | null: false |
|  name | string | null: false, index: true |
|  explanation | text | null: false |
|  category | integer | null: false, index: true |
|  condition | integer | null: false |
|  delivery_fee | integer | null: false |
|  ship_from | integer | null: false |
|  transport_days | integer | null: false |
|  price | integer | null: false |
|  seller_user | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- has_one :purchase

## purchasesテーブル
|  column | type | options |
| --- | --- | --- |
|  card_number | integer | null: false |
|  expiration_month | integer | null: false |
|  expiration_year | integer | null: false |
|  cvv | integer | null: false |
|  zipcode | integer | null: false |
|  prefecture | integer | null: false |
|  city | string | null: false |
|  address_line | string | null: false |
|  building | string | null: false |
|  phone_number | integer |  |
|  buyer_user | references | null: false, foreign_key: true |
|  item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase


## commentsテーブル
|  column | type | options |
| --- | --- | --- |
|  text | text | null: false |
|  user | references | null: false, foreign_key: true |
|  item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item