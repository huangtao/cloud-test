.class public Lcom/boyaa/util/JsonValidator;
.super Ljava/lang/Object;
.source "JsonValidator.java"


# static fields
.field private static mInstance:Lcom/boyaa/util/JsonValidator;


# instance fields
.field private c:C

.field private col:I

.field private it:Ljava/text/CharacterIterator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/util/JsonValidator;->mInstance:Lcom/boyaa/util/JsonValidator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private aggregate(CCZ)Z
    .locals 4
    .param p1, "entryCharacter"    # C
    .param p2, "exitCharacter"    # C
    .param p3, "prefix"    # Z

    .prologue
    const/4 v1, 0x1

    .line 98
    iget-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-eq v2, p1, :cond_0

    .line 99
    const/4 v1, 0x0

    .line 134
    :goto_0
    return v1

    .line 100
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 101
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->skipWhiteSpace()V

    .line 102
    iget-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-ne v2, p2, :cond_3

    .line 103
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_0

    .line 115
    .local v0, "start":I
    :cond_1
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 116
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->skipWhiteSpace()V

    .line 118
    .end local v0    # "start":I
    :cond_2
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->value()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 119
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->skipWhiteSpace()V

    .line 120
    iget-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v3, 0x2c

    if-ne v2, v3, :cond_5

    .line 121
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 130
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->skipWhiteSpace()V

    .line 108
    :cond_3
    if-eqz p3, :cond_2

    .line 109
    iget v0, p0, Lcom/boyaa/util/JsonValidator;->col:I

    .line 110
    .restart local v0    # "start":I
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->string()Z

    move-result v2

    if-nez v2, :cond_4

    .line 111
    const-string v1, "string"

    invoke-direct {p0, v1, v0}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0

    .line 112
    :cond_4
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->skipWhiteSpace()V

    .line 113
    iget-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v3, 0x3a

    if-eq v2, v3, :cond_1

    .line 114
    const-string v1, "colon"

    iget v2, p0, Lcom/boyaa/util/JsonValidator;->col:I

    invoke-direct {p0, v1, v2}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0

    .line 122
    .end local v0    # "start":I
    :cond_5
    iget-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-ne v2, p2, :cond_6

    .line 133
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_0

    .line 125
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "comma or "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/util/JsonValidator;->col:I

    invoke-direct {p0, v1, v2}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0

    .line 128
    :cond_7
    const-string v1, "value"

    iget v2, p0, Lcom/boyaa/util/JsonValidator;->col:I

    invoke-direct {p0, v1, v2}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0
.end method

.method private array()Z
    .locals 3

    .prologue
    .line 89
    const/16 v0, 0x5b

    const/16 v1, 0x5d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/boyaa/util/JsonValidator;->aggregate(CCZ)Z

    move-result v0

    return v0
.end method

.method private error(Ljava/lang/String;I)Z
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "col"    # I

    .prologue
    .line 230
    const/4 v0, 0x0

    return v0
.end method

.method private escape()Z
    .locals 3

    .prologue
    .line 198
    iget v1, p0, Lcom/boyaa/util/JsonValidator;->col:I

    add-int/lit8 v0, v1, -0x1

    .line 199
    .local v0, "start":I
    const-string v1, " \\\"/bfnrtu"

    iget-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_0

    .line 201
    const-string v1, "escape sequence  \\\",\\\\,\\/,\\b,\\f,\\n,\\r,\\t  or  \\uxxxx "

    .line 200
    invoke-direct {p0, v1, v0}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    .line 210
    :goto_0
    return v1

    .line 204
    :cond_0
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v2, 0x75

    if-ne v1, v2, :cond_2

    .line 205
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    move-result v1

    invoke-direct {p0, v1}, Lcom/boyaa/util/JsonValidator;->ishex(C)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    move-result v1

    invoke-direct {p0, v1}, Lcom/boyaa/util/JsonValidator;->ishex(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 206
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    move-result v1

    invoke-direct {p0, v1}, Lcom/boyaa/util/JsonValidator;->ishex(C)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    move-result v1

    invoke-direct {p0, v1}, Lcom/boyaa/util/JsonValidator;->ishex(C)Z

    move-result v1

    if-nez v1, :cond_2

    .line 207
    :cond_1
    const-string v1, "unicode escape sequence  \\uxxxx "

    invoke-direct {p0, v1, v0}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0

    .line 210
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static instance()Lcom/boyaa/util/JsonValidator;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/boyaa/util/JsonValidator;->mInstance:Lcom/boyaa/util/JsonValidator;

    if-nez v0, :cond_0

    .line 18
    new-instance v0, Lcom/boyaa/util/JsonValidator;

    invoke-direct {v0}, Lcom/boyaa/util/JsonValidator;-><init>()V

    sput-object v0, Lcom/boyaa/util/JsonValidator;->mInstance:Lcom/boyaa/util/JsonValidator;

    .line 20
    :cond_0
    sget-object v0, Lcom/boyaa/util/JsonValidator;->mInstance:Lcom/boyaa/util/JsonValidator;

    return-object v0
.end method

.method private ishex(C)Z
    .locals 2
    .param p1, "d"    # C

    .prologue
    .line 214
    const-string v0, "0123456789abcdefABCDEF"

    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private literal(Ljava/lang/String;)Z
    .locals 6
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 69
    new-instance v0, Ljava/text/StringCharacterIterator;

    invoke-direct {v0, p1}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    .line 70
    .local v0, "ci":Ljava/text/CharacterIterator;
    invoke-interface {v0}, Ljava/text/CharacterIterator;->first()C

    move-result v3

    .line 71
    .local v3, "t":C
    iget-char v4, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-eq v4, v3, :cond_1

    .line 72
    const/4 v1, 0x0

    .line 85
    :cond_0
    :goto_0
    return v1

    .line 74
    :cond_1
    iget v2, p0, Lcom/boyaa/util/JsonValidator;->col:I

    .line 75
    .local v2, "start":I
    const/4 v1, 0x1

    .line 76
    .local v1, "ret":Z
    invoke-interface {v0}, Ljava/text/CharacterIterator;->next()C

    move-result v3

    :goto_1
    const v4, 0xffff

    if-ne v3, v4, :cond_2

    .line 82
    :goto_2
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 83
    if-nez v1, :cond_0

    .line 84
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "literal "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v2}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    goto :goto_0

    .line 77
    :cond_2
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    move-result v4

    if-eq v3, v4, :cond_3

    .line 78
    const/4 v1, 0x0

    .line 79
    goto :goto_2

    .line 76
    :cond_3
    invoke-interface {v0}, Ljava/text/CharacterIterator;->next()C

    move-result v3

    goto :goto_1
.end method

.method private nextCharacter()C
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/boyaa/util/JsonValidator;->it:Ljava/text/CharacterIterator;

    invoke-interface {v0}, Ljava/text/CharacterIterator;->next()C

    move-result v0

    iput-char v0, p0, Lcom/boyaa/util/JsonValidator;->c:C

    .line 219
    iget v0, p0, Lcom/boyaa/util/JsonValidator;->col:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/boyaa/util/JsonValidator;->col:I

    .line 220
    iget-char v0, p0, Lcom/boyaa/util/JsonValidator;->c:C

    return v0
.end method

.method private number()Z
    .locals 4

    .prologue
    const/16 v3, 0x2d

    .line 138
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-nez v1, :cond_0

    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-eq v1, v3, :cond_0

    .line 139
    const/4 v1, 0x0

    .line 172
    :goto_0
    return v1

    .line 140
    :cond_0
    iget v0, p0, Lcom/boyaa/util/JsonValidator;->col:I

    .line 141
    .local v0, "start":I
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-ne v1, v3, :cond_1

    .line 142
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 143
    :cond_1
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v2, 0x30

    if-ne v1, v2, :cond_8

    .line 144
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 151
    :cond_2
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v2, 0x2e

    if-ne v1, v2, :cond_3

    .line 152
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 153
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 154
    :goto_1
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-nez v1, :cond_a

    .line 160
    :cond_3
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v2, 0x65

    if-eq v1, v2, :cond_4

    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v2, 0x45

    if-ne v1, v2, :cond_7

    .line 161
    :cond_4
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 162
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v2, 0x2b

    if-eq v1, v2, :cond_5

    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-ne v1, v3, :cond_6

    .line 163
    :cond_5
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 165
    :cond_6
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 166
    :goto_2
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-nez v1, :cond_c

    .line 172
    :cond_7
    const/4 v1, 0x1

    goto :goto_0

    .line 145
    :cond_8
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 146
    :goto_3
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 147
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_3

    .line 149
    :cond_9
    const-string v1, "number"

    invoke-direct {p0, v1, v0}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0

    .line 155
    :cond_a
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_1

    .line 157
    :cond_b
    const-string v1, "number"

    invoke-direct {p0, v1, v0}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_0

    .line 167
    :cond_c
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_2

    .line 169
    :cond_d
    const-string v1, "number"

    invoke-direct {p0, v1, v0}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v1

    goto/16 :goto_0
.end method

.method private object()Z
    .locals 3

    .prologue
    .line 93
    const/16 v0, 0x7b

    const/16 v1, 0x7d

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/boyaa/util/JsonValidator;->aggregate(CCZ)Z

    move-result v0

    return v0
.end method

.method private skipWhiteSpace()V
    .locals 1

    .prologue
    .line 224
    :goto_0
    iget-char v0, p0, Lcom/boyaa/util/JsonValidator;->c:C

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-nez v0, :cond_0

    .line 227
    return-void

    .line 225
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_0
.end method

.method private string()Z
    .locals 6

    .prologue
    const/16 v5, 0x22

    const/4 v2, 0x0

    .line 176
    iget-char v3, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-eq v3, v5, :cond_1

    .line 194
    :cond_0
    :goto_0
    return v2

    .line 179
    :cond_1
    iget v1, p0, Lcom/boyaa/util/JsonValidator;->col:I

    .line 180
    .local v1, "start":I
    const/4 v0, 0x0

    .line 181
    .local v0, "escaped":Z
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    :goto_1
    iget-char v3, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const v4, 0xffff

    if-ne v3, v4, :cond_2

    .line 194
    const-string v2, "quoted string"

    invoke-direct {p0, v2, v1}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v2

    goto :goto_0

    .line 182
    :cond_2
    if-nez v0, :cond_4

    iget-char v3, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_4

    .line 183
    const/4 v0, 0x1

    .line 181
    :cond_3
    :goto_2
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    goto :goto_1

    .line 184
    :cond_4
    if-eqz v0, :cond_5

    .line 185
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->escape()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 188
    const/4 v0, 0x0

    .line 189
    goto :goto_2

    :cond_5
    iget-char v3, p0, Lcom/boyaa/util/JsonValidator;->c:C

    if-ne v3, v5, :cond_3

    .line 190
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->nextCharacter()C

    .line 191
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private valid(Ljava/lang/String;)Z
    .locals 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 44
    const-string v2, ""

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 60
    :cond_0
    :goto_0
    return v0

    .line 47
    :cond_1
    const/4 v0, 0x1

    .line 48
    .local v0, "ret":Z
    new-instance v2, Ljava/text/StringCharacterIterator;

    invoke-direct {v2, p1}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/boyaa/util/JsonValidator;->it:Ljava/text/CharacterIterator;

    .line 49
    iget-object v2, p0, Lcom/boyaa/util/JsonValidator;->it:Ljava/text/CharacterIterator;

    invoke-interface {v2}, Ljava/text/CharacterIterator;->first()C

    move-result v2

    iput-char v2, p0, Lcom/boyaa/util/JsonValidator;->c:C

    .line 50
    iput v1, p0, Lcom/boyaa/util/JsonValidator;->col:I

    .line 51
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->value()Z

    move-result v2

    if-nez v2, :cond_2

    .line 52
    const-string v2, "value"

    invoke-direct {p0, v2, v1}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v0

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->skipWhiteSpace()V

    .line 55
    iget-char v1, p0, Lcom/boyaa/util/JsonValidator;->c:C

    const v2, 0xffff

    if-eq v1, v2, :cond_0

    .line 56
    const-string v1, "end"

    iget v2, p0, Lcom/boyaa/util/JsonValidator;->col:I

    invoke-direct {p0, v1, v2}, Lcom/boyaa/util/JsonValidator;->error(Ljava/lang/String;I)Z

    move-result v0

    goto :goto_0
.end method

.method private value()Z
    .locals 1

    .prologue
    .line 64
    const-string v0, "true"

    invoke-direct {p0, v0}, Lcom/boyaa/util/JsonValidator;->literal(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "false"

    invoke-direct {p0, v0}, Lcom/boyaa/util/JsonValidator;->literal(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "null"

    invoke-direct {p0, v0}, Lcom/boyaa/util/JsonValidator;->literal(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->string()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->number()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->object()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/boyaa/util/JsonValidator;->array()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public validate(Ljava/lang/String;)I
    .locals 2
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v1, 0x0

    .line 32
    .local v1, "ret":Z
    if-eqz p1, :cond_0

    .line 33
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 34
    invoke-direct {p0, p1}, Lcom/boyaa/util/JsonValidator;->valid(Ljava/lang/String;)Z

    move-result v1

    .line 36
    :cond_0
    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 40
    .local v0, "result":I
    :goto_0
    return v0

    .line 36
    .end local v0    # "result":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
