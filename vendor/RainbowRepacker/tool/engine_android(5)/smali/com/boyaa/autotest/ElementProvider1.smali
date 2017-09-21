.class public Lcom/boyaa/autotest/ElementProvider1;
.super Landroid/content/ContentProvider;
.source "ElementProvider1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;,
        Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;,
        Lcom/boyaa/autotest/ElementProvider1$LuaSetObj;
    }
.end annotation


# static fields
.field private static final AUTHORITY:Ljava/lang/String; = "com.boyaa.test.providers.element"

.field private static final ELEMENTS:I = 0x1

.field private static final GET_HIERARCHY:I = 0x0

.field public static final TESTSUPPORT_TAG:Ljava/lang/String; = "testsupport"

.field private static final matcher:Landroid/content/UriMatcher;


# instance fields
.field returnCursor:Landroid/database/MatrixCursor;

.field returnInt:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 44
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/boyaa/autotest/ElementProvider1;->matcher:Landroid/content/UriMatcher;

    .line 46
    sget-object v0, Lcom/boyaa/autotest/ElementProvider1;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.boyaa.test.providers.element"

    const-string v2, "getHierarchy"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 47
    sget-object v0, Lcom/boyaa/autotest/ElementProvider1;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.boyaa.test.providers.element"

    const-string v2, "elements"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 48
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/autotest/ElementProvider1;->returnInt:I

    .line 27
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 328
    iget-object v0, p0, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v0}, Landroid/database/MatrixCursor;->close()V

    .line 329
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 318
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 323
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 63
    sget-object v4, Lcom/boyaa/autotest/ElementProvider1;->matcher:Landroid/content/UriMatcher;

    invoke-virtual {v4, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    .line 64
    .local v3, "match":I
    const-string v4, "testsupport"

    const-string v5, "start 22222"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const-string v4, "testsupport"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    packed-switch v3, :pswitch_data_0

    .line 180
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Unknown URI: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 68
    :pswitch_0
    const-string v4, "testsupport"

    const-string v5, "start GET_HIERARCHY"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 70
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v4, "getHierarchy"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/boyaa/autotest/ElementProvider1$1;

    invoke-direct {v6, p0}, Lcom/boyaa/autotest/ElementProvider1$1;-><init>(Lcom/boyaa/autotest/ElementProvider1;)V

    invoke-static {v4, v5, v6}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 182
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    const-string v4, "testsupport"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "returnCursor4:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    return-object v4

    .line 110
    :pswitch_1
    const-string v4, "testsupport"

    const-string v5, "start elements"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const-string v4, "testsupport"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "selection in LuaGetObj function:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 114
    .local v2, "jsonObject2":Lorg/json/JSONObject;
    const-string v4, "xpath"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 115
    const-string v4, "getNodesByXPath"

    new-instance v5, Lcom/boyaa/autotest/ElementProvider1$2;

    invoke-direct {v5, p0}, Lcom/boyaa/autotest/ElementProvider1$2;-><init>(Lcom/boyaa/autotest/ElementProvider1;)V

    invoke-static {v4, p3, v5}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 149
    .end local v2    # "jsonObject2":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 133
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v2    # "jsonObject2":Lorg/json/JSONObject;
    :cond_0
    :try_start_1
    const-string v4, "getElements"

    new-instance v5, Lcom/boyaa/autotest/ElementProvider1$3;

    invoke-direct {v5, p0}, Lcom/boyaa/autotest/ElementProvider1$3;-><init>(Lcom/boyaa/autotest/ElementProvider1;)V

    invoke-static {v4, p3, v5}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 66
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 191
    const-string v0, "testsupport"

    const-string v1, "start set element"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    const-string v0, "testsupport"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "selection in LuaGetObj function:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    const-string v0, "setElementText"

    new-instance v1, Lcom/boyaa/autotest/ElementProvider1$4;

    invoke-direct {v1, p0}, Lcom/boyaa/autotest/ElementProvider1$4;-><init>(Lcom/boyaa/autotest/ElementProvider1;)V

    invoke-static {v0, p3, v1}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 203
    iget v0, p0, Lcom/boyaa/autotest/ElementProvider1;->returnInt:I

    return v0
.end method
