<?php namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Article extends Model {

	protected $fillable = [

        'title',
        'body',
        'published_at',
        'user_id' // temporary
    ];

    protected $dates = ['published_at'];

    public function scopePublished($query)
    {

        $query->where('published_at', '<=', Carbon::now());

    }

    public function scopeUnpublished($query)
    {

        $query->where('published_at', '>', Carbon::now());

    }

    public function setPublishedAtAttribute($date)
    {

        $this->attributes['published_at'] = Carbon::parse($date);

    }

    /**
     * Article is owned by a single user
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user() {

        return $this->belongsTo('App\User');

    }

}

