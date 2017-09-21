.class Lcom/boyaa/app/image/ChooseImageHandler$2;
.super Ljava/lang/Object;
.source "ChooseImageHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/ChooseImageHandler;->onSaveBitmap(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/image/ChooseImageHandler;

.field private final synthetic val$imageName:Ljava/lang/String;

.field private final synthetic val$strDicName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/ChooseImageHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/ChooseImageHandler$2;->this$0:Lcom/boyaa/app/image/ChooseImageHandler;

    iput-object p2, p0, Lcom/boyaa/app/image/ChooseImageHandler$2;->val$imageName:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/app/image/ChooseImageHandler$2;->val$strDicName:Ljava/lang/String;

    .line 414
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 417
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 418
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "Name"

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/boyaa/app/image/ChooseImageHandler$2;->val$imageName:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 420
    .local v0, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    .line 421
    .local v2, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    iget-object v4, p0, Lcom/boyaa/app/image/ChooseImageHandler$2;->val$strDicName:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    return-void
.end method
