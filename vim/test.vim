" Python testing
let test#python#runner = 'nose'
let test#strategy = 'dispatch'
let test#python#nose#options = {
            \ 'suite': '-x --nologcapture',
            \ 'nearest': '-x --nologcapture',
            \ 'file': '-x --nologcapture',
            \}
