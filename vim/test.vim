" Python testing
let test#python#runner = 'nose'
let test#python#nose#executable = 'nosetests'
let test#strategy = 'dispatch'
let test#python#nose#options = {
            \ 'suite': '-x --nologcapture',
            \ 'nearest': '-x --nologcapture',
            \ 'file': '-x --nologcapture',
            \}
