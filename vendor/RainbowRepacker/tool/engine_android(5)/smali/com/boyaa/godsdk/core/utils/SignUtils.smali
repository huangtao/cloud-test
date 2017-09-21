.class public Lcom/boyaa/godsdk/core/utils/SignUtils;
.super Ljava/lang/Object;
.source "SignUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 120
    const/4 v7, 0x0

    .line 121
    .local v7, "s":Ljava/lang/String;
    const/16 v11, 0x10

    new-array v1, v11, [C

    fill-array-data v1, :array_0

    .line 124
    .local v1, "hexDigits":[C
    :try_start_0
    const-string v11, "MD5"

    invoke-static {v11}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    .line 125
    .local v6, "md":Ljava/security/MessageDigest;
    const-string v11, "utf-8"

    invoke-virtual {p0, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/security/MessageDigest;->update([B)V

    .line 126
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v10

    .line 128
    .local v10, "tmp":[B
    array-length v5, v10

    .line 130
    .local v5, "len":I
    shl-int/lit8 v11, v5, 0x1

    new-array v9, v11, [C

    .line 131
    .local v9, "str":[C
    const/4 v3, 0x0

    .line 137
    .local v3, "k":I
    const/4 v2, 0x0

    .local v2, "i":I
    move v4, v3

    .end local v3    # "k":I
    .local v4, "k":I
    :goto_0
    if-lt v2, v5, :cond_0

    .line 142
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/lang/String;-><init>([C)V

    .end local v7    # "s":Ljava/lang/String;
    .local v8, "s":Ljava/lang/String;
    move-object v7, v8

    .line 145
    .end local v2    # "i":I
    .end local v4    # "k":I
    .end local v5    # "len":I
    .end local v6    # "md":Ljava/security/MessageDigest;
    .end local v8    # "s":Ljava/lang/String;
    .end local v9    # "str":[C
    .end local v10    # "tmp":[B
    .restart local v7    # "s":Ljava/lang/String;
    :goto_1
    return-object v7

    .line 138
    .restart local v2    # "i":I
    .restart local v4    # "k":I
    .restart local v5    # "len":I
    .restart local v6    # "md":Ljava/security/MessageDigest;
    .restart local v9    # "str":[C
    .restart local v10    # "tmp":[B
    :cond_0
    aget-byte v0, v10, v2

    .line 139
    .local v0, "byte0":B
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "k":I
    .restart local v3    # "k":I
    ushr-int/lit8 v11, v0, 0x4

    and-int/lit8 v11, v11, 0xf

    aget-char v11, v1, v11

    aput-char v11, v9, v4

    .line 140
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "k":I
    .restart local v4    # "k":I
    and-int/lit8 v11, v0, 0xf

    aget-char v11, v1, v11

    aput-char v11, v9, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 143
    .end local v0    # "byte0":B
    .end local v2    # "i":I
    .end local v4    # "k":I
    .end local v5    # "len":I
    .end local v6    # "md":Ljava/security/MessageDigest;
    .end local v9    # "str":[C
    .end local v10    # "tmp":[B
    :catch_0
    move-exception v11

    goto :goto_1

    .line 121
    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method private static getMd5Map(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 7
    .param p0, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 71
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "&"

    invoke-virtual {p0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "s_map":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v3

    if-lt v0, v4, :cond_0

    .line 79
    return-object v2

    .line 73
    :cond_0
    aget-object v4, v3, v0

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 74
    .local v1, "index":I
    if-lez v1, :cond_1

    aget-object v4, v3, v0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v1, v4, :cond_1

    .line 75
    aget-object v4, v3, v0

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 76
    aget-object v5, v3, v0

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 75
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static getSHA1HexString(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 149
    const/4 v2, 0x0

    .line 152
    .local v2, "hexstr":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .end local v2    # "hexstr":Ljava/lang/StringBuffer;
    .local v3, "hexstr":Ljava/lang/StringBuffer;
    :try_start_1
    const-string v7, "SHA-1"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 154
    .local v5, "md":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 155
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 157
    .local v0, "digest":[B
    const-string v6, ""

    .line 158
    .local v6, "shaHex":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-lt v4, v7, :cond_0

    move-object v2, v3

    .line 168
    .end local v0    # "digest":[B
    .end local v3    # "hexstr":Ljava/lang/StringBuffer;
    .end local v4    # "i":I
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v6    # "shaHex":Ljava/lang/String;
    .restart local v2    # "hexstr":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 159
    .end local v2    # "hexstr":Ljava/lang/StringBuffer;
    .restart local v0    # "digest":[B
    .restart local v3    # "hexstr":Ljava/lang/StringBuffer;
    .restart local v4    # "i":I
    .restart local v5    # "md":Ljava/security/MessageDigest;
    .restart local v6    # "shaHex":Ljava/lang/String;
    :cond_0
    :try_start_2
    aget-byte v7, v0, v4

    and-int/lit16 v7, v7, 0xff

    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    .line 160
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x2

    if-ge v7, v8, :cond_1

    .line 161
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 163
    :cond_1
    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 158
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 165
    .end local v0    # "digest":[B
    .end local v3    # "hexstr":Ljava/lang/StringBuffer;
    .end local v4    # "i":I
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v6    # "shaHex":Ljava/lang/String;
    .restart local v2    # "hexstr":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 166
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 165
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "hexstr":Ljava/lang/StringBuffer;
    .restart local v3    # "hexstr":Ljava/lang/StringBuffer;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "hexstr":Ljava/lang/StringBuffer;
    .restart local v2    # "hexstr":Ljava/lang/StringBuffer;
    goto :goto_2
.end method

.method public static getSign(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 3
    .param p0, "jsonResult"    # Lorg/json/JSONObject;

    .prologue
    .line 172
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->sortConstructVars(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    .line 173
    .local v0, "req":Ljava/lang/String;
    const-string v2, "SignUtils: req is "

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    invoke-static {v0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "sign":Ljava/lang/String;
    return-object v1
.end method

.method public static getSign(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p0, "jsonResult"    # Lorg/json/JSONObject;
    .param p1, "appkey"    # Ljava/lang/String;

    .prologue
    .line 217
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->sortConstructVars(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "req":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 219
    .local v2, "signStr":Ljava/lang/String;
    const-string v3, "SignUtils 2: signStr is "

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    invoke-static {v2}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getSHA1HexString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 221
    .local v1, "sign":Ljava/lang/String;
    return-object v1
.end method

.method public static getSign(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "reqParams"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getMd5Map(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 47
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->sortConstructVars(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "req":Ljava/lang/String;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "sign":Ljava/lang/String;
    const-string v3, "SignUtils: MD5 is "

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    return-object v2
.end method

.method public static getSign(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->sortConstructVars(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "req":Ljava/lang/String;
    const-string v2, "SignUtils: req is "

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-static {v0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "sign":Ljava/lang/String;
    return-object v1
.end method

.method public static getSignWithKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "reqParams"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getMd5Map(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 32
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v0}, Lcom/boyaa/godsdk/core/utils/SignUtils;->sortConstructVars(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "req":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&key="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 35
    .local v2, "sign":Ljava/lang/String;
    return-object v2
.end method

.method private static sortConstructVars(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "orig_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4}, Ljava/lang/String;-><init>()V

    .line 87
    .local v4, "s":Ljava/lang/String;
    new-instance v3, Ljava/util/LinkedList;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 88
    .local v3, "list":Ljava/util/List;
    new-instance v5, Lcom/boyaa/godsdk/core/utils/SignUtils$1;

    invoke-direct {v5}, Lcom/boyaa/godsdk/core/utils/SignUtils$1;-><init>()V

    invoke-static {v3, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 95
    const/4 v1, 0x1

    .line 97
    .local v1, "first_param":Z
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "itr":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 116
    return-object v4

    .line 98
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 99
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 101
    if-eqz v1, :cond_2

    .line 102
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 103
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 104
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 105
    const/4 v1, 0x0

    .line 106
    goto :goto_0

    .line 108
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 109
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 110
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0
.end method

.method private static sortConstructVars(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 8
    .param p0, "jsonResult"    # Lorg/json/JSONObject;

    .prologue
    .line 180
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 182
    .local v4, "sb":Ljava/lang/StringBuffer;
    if-nez p0, :cond_0

    .line 183
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 214
    :goto_0
    return-object v6

    .line 186
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 187
    .local v2, "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 188
    .local v3, "keyList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 192
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 194
    const/4 v0, 0x1

    .line 196
    .local v0, "first_param":Z
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_3

    .line 214
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 189
    .end local v0    # "first_param":Z
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 196
    .restart local v0    # "first_param":Z
    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 197
    .local v1, "key":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 198
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 199
    .local v5, "value":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 200
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 201
    const-string v7, "="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 202
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 203
    const/4 v0, 0x0

    .line 204
    goto :goto_2

    .line 206
    :cond_4
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 207
    const-string v7, "="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 208
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2
.end method
