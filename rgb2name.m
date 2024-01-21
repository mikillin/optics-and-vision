function name=rgb2name(x)
%RGB2NAME convert RGB color to color name string
% useage: name=rgb2name(x) returns the name of the color in the 3x1 RGB color vector x
% x may also be a 3xn array of colors (colormap), but color names are calculated in a loop,
% so it is not recommended that you try this for large values of n. If x is an array, the output will be a cell array of strings.
%
% Color names are calculated based on a simple nearest-neighbor search to ~450 named points in the RGB space.
% Additional colors may be added by appending their name and RGB values to the end of the appropriate lists below.
% If you add a color that is already in the list, the name you add will be used.
%
% By Matt Daskilewicz <mattdaskil@gatech.edu> 12/2008
%


dims=size(x);


if numel(dims)>2 || ~any(dims==3)
    error('Input must be a 3x1 or 3xn array')
end

if any(x(:)<0 | x(:)>1)
    error('All elements of input array must be in the range 0 to 1')
end

if dims(1)==3 && dims(2)~=3
    x=x';
end

dims=size(x);

x=x.*255;
colorlist=getcolors;
colornames=getnames;

name=cell(dims(1),1);
%do nearest point search:
for i=1:dims(1)
    diffs=bsxfun(@minus,x(i,:),colorlist);
    dists=sum(diffs.^2,2);
    nearest=find(dists==min(dists),1,'last');
    name{i}=colornames{nearest};
end

if numel(name)==1
    name=name{1};
end

function colornames=getnames
colornames={'indian red';
    'crimson';
    'very light pink';
    'light pink';
    'light pink';
    'dull pink';
    'dull dark pink';
    'light pink';
    'pink';
    'pink';
    'dull pink';
    'dull dark pink';
    'deep pink';
    'pink';
    'pink';
    'deep pink';
    'dark deep pink';
    'off-white';
    'very pale lavender';
    'pale lavender';
    'dull lavender';
    'violet red';
    'violet red';
    'deep violet red';
    'dark deep violet red';
    'hot pink';
    'hot pink';
    'hot pink';
    'dark hot pink';
    'dark dull pink';
    'raspberry';
    'deep pink';
    'deep pink';
    'deep pink';
    'dark deep maroon';
    'light maroon';
    'maroon';
    'maroon';
    'dark maroon';
    'medium violet red';
    'violetred';
    'light orchid';
    'orchid';
    'orchid';
    'orchid';
    'dark orchid';
    'light thistle';
    'thistle';
    'thistle';
    'dull thistle';
    'dark dull thistle';
    'light plum';
    'plum';
    'plum';
    'dark dull plum';
    'light plum';
    'pink-violet';
    'fuchsia';
    'magenta';
    'magenta';
    'deep purple';
    'purple';
    'medium orchid';
    'medium orchid';
    'medium orchid';
    'dull medium orchid';
    'dark medium orchid';
    'dark violet';
    'dark orchid';
    'dark orchid';
    'dark orchid';
    'dark orchid';
    'very dark orchid';
    'indigo';
    'blue violet';
    'purple';
    'purple';
    'purple';
    'dark purple';
    'pale purple';
    'pale purple';
    'pale purple';
    'pale purple';
    'dark pale purple';
    'dark slate blue';
    'light slate blue';
    'medium slate blue';
    'slate blue';
    'slate blue';
    'slate blue';
    'slate blue';
    'dark slate blue';
    'ghost-white';
    'very faint lavender';
    'blue';
    'blue';
    'medium blue';
    'dark blue';
    'navy';
    'midnight blue';
    'cobalt';
    'royal blue';
    'bright royal blue';
    'royal blue';
    'royal blue';
    'dark royal blue';
    'cornflower blue';
    'light steel blue';
    'very light steel blue';
    'light steel blue';
    'steel blue';
    'dull dark steel blue';
    'slate gray';
    'slate gray';
    'very light slate gray';
    'light slate gray';
    'light slate gray';
    'medium slate gray';
    'dodger blue';
    'dodger blue';
    'dodger blue';
    'dark dodger blue';
    'very faint blue';
    'steel blue';
    'steel blue';
    'steel blue';
    'steel blue';
    'dark steel blue';
    'light sky blue';
    'light sky blue';
    'light sky blue';
    'dull sky blue';
    'dark dull sky blue';
    'sky blue';
    'sky blue';
    'sky blue';
    'steel blue';
    'sky blue';
    'bright deep sky blue';
    'deep sky blue';
    'deep sky blue';
    'dark deep sky blue';
    'peacock';
    'light blue';
    'light blue';
    'light blue';
    'dull light blue';
    'dull medium blue';
    'powder blue';
    'cadet blue';
    'cadet blue';
    'cadet blue';
    'dark cadet blue';
    'turquoise';
    'turquoise';
    'turquoise';
    'dark turquoise';
    'cadet blue';
    'dark turquoise';
    'very faint azure';
    'azure';
    'dull azure';
    'dark dull azure';
    'light cyan';
    'light cyan';
    'dull light cyan';
    'dull cyan';
    'pale turquoise';
    'pale turquoise';
    'pale turquoise';
    'dark pale turquoise';
    'very dark turquoise';
    'light turquoise';
    'turquoise';
    'turquoise';
    'dull turquoise';
    'bright cyan';
    'cyan';
    'cyan';
    'dark cyan';
    'dark teal';
    'medium turquoise';
    'manganese blue';
    'manganese blue';
    'turquoise';
    'cold grey';
    'turquoise green';
    'aquamarine';
    'aquamarine';
    'aquamarine';
    'dark aquamarine';
    'medium spring green';
    'mint cream';
    'bright spring green';
    'spring green';
    'spring green';
    'dark spring green';
    'medium sea green';
    'bright sea green';
    'sea green';
    'dull sea green';
    'dark dull sea green';
    'emerald green';
    'mint';
    'cobalt green';
    'very faint honeydew';
    'honeydew';
    'grayish honeydew';
    'greenish gray';
    'light sea green';
    'dark sea green';
    'light sea green';
    'sea green';
    'dark sea green';
    'pale green';
    'pale green';
    'pale green';
    'dull green';
    'dark dull green';
    'lime green';
    'forest green';
    'lime green';
    'bright green';
    'green';
    'green';
    'dark green';
    'dark forest green';
    'sap green';
    'lawn green';
    'bright chartreuse';
    'chartreuse';
    'dark chartreuse';
    'dark chartreuse';
    'green-yellow';
    'pale olive green';
    'light olive green';
    'olive green';
    'olive green';
    'dark olive green';
    'light olive drab';
    'olive drab';
    'olive drab';
    'yellow-green';
    'olive drab';
    'pale ivory';
    'ivory';
    'ivory';
    'ivory';
    'beige';
    'very faint yellow';
    'light yellow';
    'light gray';
    'medium gray';
    'extremely faint goldenrod';
    'yellow';
    'yellow';
    'greenish yellow';
    'olive green';
    'warm grey';
    'olive green';
    'dark khaki';
    'light khaki';
    'khaki';
    'khaki';
    'dark khaki';
    'khaki';
    'pale golden rod';
    'lemon chiffon';
    'lemon chiffon';
    'dull lemon chiffon';
    'medium gray';
    'light goldenrod';
    'light goldenrod';
    'dull goldenrod';
    'dark goldenrod';
    'banana';
    'gold';
    'gold';
    'gold';
    'dark gold';
    'light beige';
    'light french gray';
    'light gray';
    'medium gray';
    'goldenrod';
    'goldenrod';
    'goldenrod';
    'goldenrod';
    'dark goldenrod';
    'dark goldenrod';
    'goldenrod';
    'dark goldenrod';
    'dark goldenrod';
    'dark goldenrod';
    'bright orange';
    'orange';
    'orange';
    'dark orange';
    'floral white';
    'off-white';
    'flesh';
    'pale flesh';
    'flesh';
    'taupe';
    'dark taupe';
    'moccasin';
    'papaya whip';
    'blanched almond';
    'navajo white';
    'navajo white';
    'dark navajo white';
    'very dark navajo white';
    'eggshell white';
    'tan';
    'brick';
    'cadmium yellow';
    'antique white';
    'antique white';
    'antique white';
    'dark antique white';
    'medium french gray';
    'burlywood';
    'burlywood';
    'burlywood';
    'burlywood';
    'dark burlywood';
    'bisque';
    'bisque';
    'french gray';
    'dark french gray';
    'melon';
    'carrot';
    'orange';
    'orange';
    'dark orange';
    'dark orange';
    'brown';
    'orange';
    'tan';
    'tan';
    'dark tan';
    'brown';
    'linen';
    'peachpuff';
    'peachpuff';
    'dull peachpuff';
    'dark dull peachpuff';
    'faint seashell';
    'seashell';
    'light gray';
    'medium gray';
    'sandy brown';
    'raw sienna';
    'burnt orange';
    'burnt orange';
    'burnt orange';
    'burnt orange';
    'chocolate';
    'ivory black';
    'flesh';
    'cadmium orange';
    'burnt sienna';
    'orange sienna';
    'sienna';
    'sienna';
    'sienna';
    'sienna';
    'light salmon';
    'light salmon';
    'light salmon';
    'dull medium salmon';
    'coral';
    'orange-red';
    'orange-red';
    'orange-red';
    'dark orange-red';
    'dark sepia';
    'pale salmon';
    'salmon';
    'salmon';
    'salmon';
    'dull reddish brown';
    'coral';
    'coral';
    'coral';
    'dark coral';
    'burnt umber';
    'tomato';
    'tomato';
    'tomato';
    'dark tomato';
    'salmon';
    'misty rose';
    'misty rose';
    'misty rose';
    'medium reddish gray';
    'snow white';
    'very light gray';
    'light gray';
    'medium gray';
    'dull rosy brown';
    'dull rosy brown';
    'dull rosy brown';
    'dull rosy brown';
    'dark rosy brown';
    'light coral';
    'indian red';
    'indian red';
    'indian red';
    'dark indian red';
    'indian red';
    'dull red';
    'dull red';
    'dull red';
    'dull red';
    'dark dull red';
    'red';
    'red';
    'red';
    'red';
    'dark red';
    'bright red';
    'bright red';
    'bright red';
    'dark bright red';
    'maroon';
    'beet purple';
    'slate blue';
    'light blue';
    'teal';
    'chartreuse';
    'olive drab';
    'bright gray';
    'dull salmon';
    'black';
    'charcoal gray';
    'dark gray';
    'medium gray';
    'light gray';
    'very light gray';
    'very faint gray';
    'white';
    'dark cornflower blue';
    'really dark red';
    'really dark green';
    'really dark blue';
    'really dark yellow';
    'really dark purple';
    'really dark turquoise';
    'dark dull brown';
    'violet';
    'magenta';
    'dark dull purple';
    'dark dull green';
    'dull green';
    'dark forest green';
    'very dull sea green';
    'very dark dull yellow';
    'puke yellow';
    'puke green'};

% here be the color values:
function colorlist=getcolors

colorlist=[176  23  31  ;
    220 20  60  ;
    255 182 193 ;
    255 174 185 ;
    238 162 173 ;
    205 140 149 ;
    139 95  101 ;
    255 192 203 ;
    255 181 197 ;
    238 169 184 ;
    205 145 158 ;
    139 99  108 ;
    219 112 147 ;
    255 130 171 ;
    238 121 159 ;
    205 104 137 ;
    139 71  93  ;
    255 240 245 ;
    238 224 229 ;
    205 193 197 ;
    139 131 134 ;
    255 62  150 ;
    238 58  140 ;
    205 50  120 ;
    139 34  82  ;
    255 105 180 ;
    255 110 180 ;
    238 106 167 ;
    205 96  144 ;
    139 58  98  ;
    135 38  87  ;
    255 20  147 ;
    238 18  137 ;
    205 16  118 ;
    139 10  80  ;
    255 52  179 ;
    238 48  167 ;
    205 41  144 ;
    139 28  98  ;
    199 21  133 ;
    208 32  144 ;
    218 112 214 ;
    255 131 250 ;
    238 122 233 ;
    205 105 201 ;
    139 71  137 ;
    216 191 216 ;
    255 225 255 ;
    238 210 238 ;
    205 181 205 ;
    139 123 139 ;
    255 187 255 ;
    238 174 238 ;
    205 150 205 ;
    139 102 139 ;
    221 160 221 ;
    238 130 238 ;
    255 0   255 ;
    238 0   238 ;
    205 0   205 ;
    139 0   139 ;
    128 0   128 ;
    186 85  211 ;
    224 102 255 ;
    209 95  238 ;
    180 82  205 ;
    122 55  139 ;
    148 0   211 ;
    153 50  204 ;
    191 62  255 ;
    178 58  238 ;
    154 50  205 ;
    104 34  139 ;
    75  0   130 ;
    138 43  226 ;
    155 48  255 ;
    145 44  238 ;
    125 38  205 ;
    85  26  139 ;
    147 112 219 ;
    171 130 255 ;
    159 121 238 ;
    137 104 205 ;
    93  71  139 ;
    72  61  139 ;
    132 112 255 ;
    123 104 238 ;
    106 90  205 ;
    131 111 255 ;
    122 103 238 ;
    105 89  205 ;
    71  60  139 ;
    248 248 255 ;
    230 230 250 ;
    0   0   255 ;
    0   0   238 ;
    0   0   205 ;
    0   0   139 ;
    0   0   128 ;
    25  25  112 ;
    61  89  171 ;
    65  105 225 ;
    72  118 255 ;
    67  110 238 ;
    58  95  205 ;
    39  64  139 ;
    100 149 237 ;
    176 196 222 ;
    202 225 255 ;
    188 210 238 ;
    162 181 205 ;
    110 123 139 ;
    119 136 153 ;
    112 128 144 ;
    198 226 255 ;
    185 211 238 ;
    159 182 205 ;
    108 123 139 ;
    30  144 255 ;
    28  134 238 ;
    24  116 205 ;
    16  78  139 ;
    240 248 255 ;
    70  130 180 ;
    99  184 255 ;
    92  172 238 ;
    79  148 205 ;
    54  100 139 ;
    135 206 250 ;
    176 226 255 ;
    164 211 238 ;
    141 182 205 ;
    96  123 139 ;
    135 206 255 ;
    126 192 238 ;
    108 166 205 ;
    74  112 139 ;
    135 206 235 ;
    0   191 255 ;
    0   178 238 ;
    0   154 205 ;
    0   104 139 ;
    51  161 201 ;
    173 216 230 ;
    191 239 255 ;
    178 223 238 ;
    154 192 205 ;
    104 131 139 ;
    176 224 230 ;
    152 245 255 ;
    142 229 238 ;
    122 197 205 ;
    83  134 139 ;
    0   245 255 ;
    0   229 238 ;
    0   197 205 ;
    0   134 139 ;
    95  158 160 ;
    0   206 209 ;
    240 255 255 ;
    224 238 238 ;
    193 205 205 ;
    131 139 139 ;
    224 255 255 ;
    209 238 238 ;
    180 205 205 ;
    122 139 139 ;
    187 255 255 ;
    174 238 238 ;
    150 205 205 ;
    102 139 139 ;
    47  79  79  ;
    151 255 255 ;
    141 238 238 ;
    121 205 205 ;
    82  139 139 ;
    0   255 255 ;
    0   238 238 ;
    0   205 205 ;
    0   139 139 ;
    0   128 128 ;
    72  209 204 ;
    32  178 170 ;
    3   168 158 ;
    64  224 208 ;
    128 138 135 ;
    0   199 140 ;
    127 255 212 ;
    118 238 198 ;
    102 205 170 ;
    69  139 116 ;
    0   250 154 ;
    245 255 250 ;
    0   255 127 ;
    0   238 118 ;
    0   205 102 ;
    0   139 69  ;
    60  179 113 ;
    84  255 159 ;
    78  238 148 ;
    67  205 128 ;
    46  139 87  ;
    0   201 87  ;
    189 252 201 ;
    61  145 64  ;
    240 255 240 ;
    224 238 224 ;
    193 205 193 ;
    131 139 131 ;
    143 188 143 ;
    193 255 193 ;
    180 238 180 ;
    155 205 155 ;
    105 139 105 ;
    152 251 152 ;
    154 255 154 ;
    144 238 144 ;
    124 205 124 ;
    84  139 84  ;
    50  205 50  ;
    34  139 34  ;
    0   255 0   ;
    0   238 0   ;
    0   205 0   ;
    0   139 0   ;
    0   128 0   ;
    0   100 0   ;
    48  128 20  ;
    124 252 0   ;
    127 255 0   ;
    118 238 0   ;
    102 205 0   ;
    69  139 0   ;
    173 255 47  ;
    202 255 112 ;
    188 238 104 ;
    162 205 90  ;
    110 139 61  ;
    85  107 47  ;
    107 142 35  ;
    192 255 62  ;
    179 238 58  ;
    154 205 50  ;
    105 139 34  ;
    255 255 240 ;
    238 238 224 ;
    205 205 193 ;
    139 139 131 ;
    245 245 220 ;
    255 255 224 ;
    238 238 209 ;
    205 205 180 ;
    139 139 122 ;
    250 250 210 ;
    255 255 0   ;
    238 238 0   ;
    205 205 0   ;
    139 139 0   ;
    128 128 105 ;
    128 128 0   ;
    189 183 107 ;
    255 246 143 ;
    238 230 133 ;
    205 198 115 ;
    139 134 78  ;
    240 230 140 ;
    238 232 170 ;
    255 250 205 ;
    238 233 191 ;
    205 201 165 ;
    139 137 112 ;
    255 236 139 ;
    238 220 130 ;
    205 190 112 ;
    139 129 76  ;
    227 207 87  ;
    255 215 0   ;
    238 201 0   ;
    205 173 0   ;
    139 117 0   ;
    255 248 220 ;
    238 232 205 ;
    205 200 177 ;
    139 136 120 ;
    218 165 32  ;
    255 193 37  ;
    238 180 34  ;
    205 155 29  ;
    139 105 20  ;
    184 134 11  ;
    255 185 15  ;
    238 173 14  ;
    205 149 12  ;
    139 101 8   ;
    255 165 0   ;
    238 154 0   ;
    205 133 0   ;
    139 90  0   ;
    255 250 240 ;
    253 245 230 ;
    245 222 179 ;
    255 231 186 ;
    238 216 174 ;
    205 186 150 ;
    139 126 102 ;
    255 228 181 ;
    255 239 213 ;
    255 235 205 ;
    255 222 173 ;
    238 207 161 ;
    205 179 139 ;
    139 121 94  ;
    252 230 201 ;
    210 180 140 ;
    156 102 31  ;
    255 153 18  ;
    250 235 215 ;
    255 239 219 ;
    238 223 204 ;
    205 192 176 ;
    139 131 120 ;
    222 184 135 ;
    255 211 155 ;
    238 197 145 ;
    205 170 125 ;
    139 115 85  ;
    255 228 196 ;
    238 213 183 ;
    205 183 158 ;
    139 125 107 ;
    227 168 105 ;
    237 145 33  ;
    255 140 0   ;
    255 127 0   ;
    238 118 0   ;
    205 102 0   ;
    139 69  0   ;
    255 128 0   ;
    255 165 79  ;
    238 154 73  ;
    205 133 63  ;
    139 90  43  ;
    250 240 230 ;
    255 218 185 ;
    238 203 173 ;
    205 175 149 ;
    139 119 101 ;
    255 245 238 ;
    238 229 222 ;
    205 197 191 ;
    139 134 130 ;
    244 164 96  ;
    199 97  20  ;
    210 105 30  ;
    255 127 36  ;
    238 118 33  ;
    205 102 29  ;
    139 69  19  ;
    41  36  33  ;
    255 125 64  ;
    255 97  3   ;
    138 54  15  ;
    160 82  45  ;
    255 130 71  ;
    238 121 66  ;
    205 104 57  ;
    139 71  38  ;
    255 160 122 ;
    238 149 114 ;
    205 129 98  ;
    139 87  66  ;
    255 127 80  ;
    255 69  0   ;
    238 64  0   ;
    205 55  0   ;
    139 37  0   ;
    94  38  18  ;
    233 150 122 ;
    255 140 105 ;
    238 130 98  ;
    205 112 84  ;
    139 76  57  ;
    255 114 86  ;
    238 106 80  ;
    205 91  69  ;
    139 62  47  ;
    138 51  36  ;
    255 99  71  ;
    238 92  66  ;
    205 79  57  ;
    139 54  38  ;
    250 128 114 ;
    255 228 225 ;
    238 213 210 ;
    205 183 181 ;
    139 125 123 ;
    255 250 250 ;
    238 233 233 ;
    205 201 201 ;
    139 137 137 ;
    188 143 143 ;
    255 193 193 ;
    238 180 180 ;
    205 155 155 ;
    139 105 105 ;
    240 128 128 ;
    205 92  92  ;
    255 106 106 ;
    238 99  99  ;
    139 58  58  ;
    205 85  85  ;
    165 42  42  ;
    255 64  64  ;
    238 59  59  ;
    205 51  51  ;
    139 35  35  ;
    178 34  34  ;
    255 48  48  ;
    238 44  44  ;
    205 38  38  ;
    139 26  26  ;
    255 0   0   ;
    238 0   0   ;
    205 0   0   ;
    139 0   0   ;
    128 0   0   ;
    142 56  142 ;
    113 113 198 ;
    125 158 192 ;
    56  142 142 ;
    113 198 113 ;
    142 142 56  ;
    197 193 170 ;
    198 113 113;
    0   0   0;
    64  64  64;
    84  84  84;
    127 127 127;
    168 168 168;
    209 209 209;
    222 222 222;
    255 255 255;
    102 51  255;
    51   0  0;
    0   51  0;
    0  0   51;
    51  51  0;
    51  0   51;
    0   51  51;
    97  61  60;
    153 0 204;
    224 25 178;
    85 49 75;
    50 65 50;
    85 125 85;
    50 100 50;
    113 133 113;
    106 110 60;
    176 186 36;
    144 209 70];