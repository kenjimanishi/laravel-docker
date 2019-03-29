# laravel-docker ver1.0 [in Japanese](README.md)
## What is this?
* A kind of template that can run Laravel app inside Docker container
## Procedure（Only as for 2 steps!）
1. Run `init.sh`
```
$ ./init.sh [application name]
```
2. Verify that Laravel is running in your browser
* [localhost:8080](http://localhost:8080/)

## Version, Settings

| Name | Version / Settings |
|-|-|
| Laravel  | 5.7
| PHP | 7.2 |
| MySQL | 5.6 |
| TIME_ZONE | UTC |

## Note on migrating

Edit `app\Providers\AppServiceProvider.php` to remove `Syntax error or access violation`

（Reference-> [laravel-news.com](https://laravel-news.com/laravel-5-4-key-too-long-error)）

```
use Illuminate\Support\Facades\Schema; # <-- add

public function boot()
{
    Schema::defaultStringLength(191); # <-- add
}
```