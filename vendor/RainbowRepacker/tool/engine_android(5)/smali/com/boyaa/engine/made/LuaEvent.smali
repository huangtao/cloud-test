.class public Lcom/boyaa/engine/made/LuaEvent;
.super Ljava/lang/Object;
.source "LuaEvent.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ClearOSTimeout()V
    .locals 4

    .prologue
    .line 44
    const-string v1, "OSTimeout"

    const-string v2, "id"

    const/16 v3, 0x7d0

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 45
    .local v0, "id":I
    invoke-static {v0}, Lcom/boyaa/engine/made/AppActivity;->ClearTimeout(I)V

    .line 46
    return-void
.end method

.method public static HttpGet()V
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/boyaa/engine/made/AppHttpGet;

    invoke-direct {v0}, Lcom/boyaa/engine/made/AppHttpGet;-><init>()V

    .line 25
    .local v0, "post":Lcom/boyaa/engine/made/AppHttpGet;
    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppHttpGet;->Execute()V

    .line 26
    return-void
.end method

.method public static HttpPost()V
    .locals 1

    .prologue
    .line 14
    new-instance v0, Lcom/boyaa/engine/made/AppHttpPost;

    invoke-direct {v0}, Lcom/boyaa/engine/made/AppHttpPost;-><init>()V

    .line 15
    .local v0, "post":Lcom/boyaa/engine/made/AppHttpPost;
    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppHttpPost;->Execute()V

    .line 16
    return-void
.end method

.method public static OnLuaCall()V
    .locals 1

    .prologue
    .line 34
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppActivity;->OnLuaCall()V

    .line 35
    return-void
.end method

.method public static SetOSTimeout()V
    .locals 5

    .prologue
    .line 38
    const-string v2, "OSTimeout"

    const-string v3, "id"

    const/16 v4, 0x3e8

    invoke-static {v2, v3, v4}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 39
    .local v0, "id":I
    const-string v2, "OSTimeout"

    const-string v3, "ms"

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 40
    .local v1, "ms":I
    int-to-long v2, v1

    invoke-static {v0, v2, v3}, Lcom/boyaa/engine/made/AppActivity;->SetTimeout(IJ)V

    .line 41
    return-void
.end method
