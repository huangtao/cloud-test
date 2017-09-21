.class Lcom/umeng/analytics/c$4;
.super Lcom/umeng/analytics/e;
.source "InternalAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/umeng/analytics/c;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/umeng/analytics/c;


# direct methods
.method constructor <init>(Lcom/umeng/analytics/c;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 246
    iput-object p1, p0, Lcom/umeng/analytics/c$4;->c:Lcom/umeng/analytics/c;

    iput-object p2, p0, Lcom/umeng/analytics/c$4;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/umeng/analytics/c$4;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/umeng/analytics/e;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .prologue
    .line 248
    iget-object v0, p0, Lcom/umeng/analytics/c$4;->c:Lcom/umeng/analytics/c;

    invoke-static {v0}, Lcom/umeng/analytics/c;->a(Lcom/umeng/analytics/c;)Lu/aly/n;

    move-result-object v0

    iget-object v1, p0, Lcom/umeng/analytics/c$4;->a:Ljava/lang/String;

    iget-object v2, p0, Lcom/umeng/analytics/c$4;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lu/aly/n;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    return-void
.end method
