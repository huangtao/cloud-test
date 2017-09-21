.class Lcom/boyaa/app/EmbedWebView$5;
.super Ljava/lang/Object;
.source "EmbedWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/EmbedWebView;->setWebState(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/EmbedWebView;

.field private final synthetic val$state:I


# direct methods
.method constructor <init>(Lcom/boyaa/app/EmbedWebView;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/EmbedWebView$5;->this$0:Lcom/boyaa/app/EmbedWebView;

    iput p2, p0, Lcom/boyaa/app/EmbedWebView$5;->val$state:I

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 444
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 445
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "state"

    iget v4, p0, Lcom/boyaa/app/EmbedWebView$5;->val$state:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 447
    .local v0, "json":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    .line 448
    .local v2, "ret":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    const-string v4, "onWebState"

    invoke-virtual {v3, v4, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    return-void
.end method
