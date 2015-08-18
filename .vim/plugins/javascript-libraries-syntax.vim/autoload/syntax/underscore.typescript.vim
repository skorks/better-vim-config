" Vim syntax file
" Language:    underscore.js for typescript
" Maintainer:  othree <othree@gmail.com>
" Last Change: 2015/01/27
" Version:     1.7.0
" URL:         http://underscorejs.org/
" LoDash:      3.0.0
" URL:         http://lodash.com/

syntax keyword typescriptunderscore _ containedin=ALLBUT,typescriptComment,typescriptLineComment,typescriptString,typescriptTemplate,typescriptTemplateSubstitution
" syntax match   typescriptunderscoredot contained /\./ nextgroup=@typescript_Functions
" syntax match   typescriptunderscoredot contained /([^)]*)\./ nextgroup=@typescript_Functions

syntax cluster typescript_Functions contains=typescript_collections,typescript_strings,typescript_arrays,typescript_functions,typescript_objects,typescript_chaining,typescript_lodash

syntax match   typescript_collections contained /contains/
syntax keyword typescript_collections contained include
syntax keyword typescript_collections contained each map reduce reduceRight find filter where findWhere
syntax keyword typescript_collections contained reject every some invoke pluck max min sortBy
syntax keyword typescript_collections contained groupBy indexBy countBy shuffle toArray size
syntax keyword typescript_collections contained partition iteratee
" lodash 3.0.0
syntax keyword typescript_collections contained partition sortByAll includes callback
"
" lodash 3.0.0
syntax keyword typescript_strings contained camelCase capitalize deburr endsWith escapeRegExp
syntax keyword typescript_strings contained kebabCase pad padLeft padRight repeat snakeCase
syntax keyword typescript_strings contained startsWith trim trimLeft trimRight trunc words
"
syntax keyword typescript_arrays contained first initial last rest compact flatten without union
syntax keyword typescript_arrays contained intersection difference uniq zip object indextOf
syntax keyword typescript_arrays contained lastIndexOf sortedIndex range
" lodash 3.0.0
syntax keyword typescript_arrays contained chunk dropRight dropRightWhile dropWhile flattenDeep
syntax keyword typescript_arrays contained pullAt slice sortedLastIndex takeRight takeRightWhile
syntax keyword typescript_arrays contained takeWhile

syntax keyword typescript_functions contained bind bindAll partial memoize delay throttle debounce
syntax keyword typescript_functions contained once after before wrap negate compose flow flowRight
" lodash 3.0.0
syntax keyword typescript_functions contained ary before curryRight negate rearg
syntax keyword typescript_functions contained backflow compose partial cancel

syntax keyword typescript_objects contained keys values pairs invert functions extend pick omit
syntax keyword typescript_objects contained defaults clone tap has isEqual isEmpty isElement isArray
syntax keyword typescript_objects contained isObject isArguments isFunction isString isNumber
syntax keyword typescript_objects contained isFinite isBoolean isDate isRegExp isNaN isNull
syntax keyword typescript_objects contained isUndefined property matches
" lodash 3.0.0
syntax keyword typescript_objects contained keysIn valuesIn assign get set
syntax keyword typescript_objects contained mapKeys
"
syntax keyword typescript_utility contained noConflict identify times random mixin uniqueId
syntax keyword typescript_utility contained escape unescape result template iteratee noop
" lodash 3.0.0
syntax keyword typescript_utility contained attempt matches matchesProperty propertyOf constant now
syntax keyword typescript_utility contained attempt matches matchesProperty propertyOf constant now

syntax keyword typescript_chaining contained chain value thru

syntax keyword typescript_lodash contained at bindKey cloneDeep createCallback findIndex findKey
syntax keyword typescript_lodash contained forEach forIn forOwn isPlainObject merge parseInt partial
syntax keyword typescript_lodash contained partialRight runInContext support unzip where
syntax keyword typescript_lodash contained capitalize match slice trim trimLeft trimRight
syntax keyword typescript_lodash contained constant mapValues now property xor
syntax keyword typescript_lodash contained create noop transform
" lodash 3.0.0
syntax keyword typescript_lodash contained isError isMatch isNative isTypedArray toPlainObject
"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_underscore_typescript_syntax_inits")
  if version < 508
    let did_underscore_typescript_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink typescriptunderscore      Constant

  HiLink typescript_collections    PreProc
  HiLink typescript_strings        PreProc
  HiLink typescript_arrays         PreProc
  HiLink typescript_functions      PreProc
  HiLink typescript_objects        PreProc
  HiLink typescript_utility        PreProc
  HiLink typescript_chaining       PreProc
  HiLink typescript_lodash         PreProc

  delcommand HiLink
endif
