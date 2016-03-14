<?php namespace App\Http\Controllers;

use App\Article;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Requests\ArticleRequest;
use Carbon\Carbon;
use Request;

class ArticlesController extends Controller {

    /*
    Show all articles
    @return response
    */

	public function index() {

        $articles = Article::latest('published_at')->published()->get();
        return view('articles.index', compact('articles'));
    }

    /*
    Show a single article
    @return response
    */

    public function show($id) {

        $article = Article::findOrFail($id);
        dd($article->published_at);
        return view('articles.show', compact('article'));

    }

    /*
    Show the page to create a new article
    @return response
    */

    public function create() {

        return view('articles.create');

    }

    /*
    Show the page to create a new article
    @return response
    */

    public function store(ArticleRequest $request) {

        // validation
        $article = new Article($request->all());
        \Auth::user()->articles()->save($article);

        return redirect('articles');


    }

    public function edit($id) {

        $article = Article::findOrFail($id);
        return view('articles.edit', compact('article'));

    }

    public function update($id, ArticleRequest $request) {

        $article = Article::findOrFail($id);
        $article->update($request->all());
        return redirect('articles');
        
    }

}

