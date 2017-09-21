.class Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;

.field private final synthetic val$extraInfo:Ljava/lang/String;

.field private final synthetic val$subTypeName:Ljava/lang/String;

.field private final synthetic val$typeName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->this$2:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;

    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->val$typeName:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->val$subTypeName:Ljava/lang/String;

    iput-object p4, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->val$extraInfo:Ljava/lang/String;

    .line 510
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 513
    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->val$typeName:Ljava/lang/String;

    .line 514
    .local v2, "typeName2":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 515
    :cond_0
    const-string v2, "0"

    .line 517
    :cond_1
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->val$subTypeName:Ljava/lang/String;

    .line 518
    .local v1, "subTypeName2":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    .line 519
    :cond_2
    const-string v1, "0"

    .line 521
    :cond_3
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;->val$extraInfo:Ljava/lang/String;

    .line 522
    .local v0, "extraInfo2":Ljava/lang/String;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_5

    .line 523
    :cond_4
    const-string v0, "0"

    .line 525
    :cond_5
    const-string v3, "network_info"

    const-string v4, "type_name"

    invoke-static {v3, v4, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    const-string v3, "network_info"

    const-string v4, "type_sub_name"

    invoke-static {v3, v4, v1}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    const-string v3, "network_info"

    const-string v4, "extra_info"

    invoke-static {v3, v4, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    return-void
.end method
