package main

func main() {
	// 创建一个Foo路由和处理函数
	http.Handle("/foo", fooHandler)

	// 创建一个bar路由和处理函数
	http.HandlerFunc("/bar", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", html.EscapseString(r.URL.Path))
	})
}
