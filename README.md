# laravel-docker
## これは何？
* Dockerコンテナ内でLaravelアプリを稼働させることができるテンプレートのようなもの
## 手順
1. `init.sh` を実行
```
$ ./init.sh [アプリ名]
```
2. ブラウザでLaravelが実行されていることを確認
* [localhost:8080](http://localhost:8080/)

## バージョン・設定値

|  名前  | バージョン / 設定値   |
|  --  | --   |
| Laravel | 5.7 |
| PHP| 7.2 |
| MySQL| 5.6 |
| TIME_ZONE| UTC |

## migrateする際の注意

Syntax error or access violationが発生するので、`app\Providers\AppServiceProvider.php` を編集しておく

（参照 -> [laravel-news.com](https://laravel-news.com/laravel-5-4-key-too-long-error
)）

``` 
use Illuminate\Support\Facades\Schema; # <-- add

public function boot()
{
    Schema::defaultStringLength(191); # <-- add
}
```
