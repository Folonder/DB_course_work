#pragma checksum "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "e6a8ce4f693ad321cd6904e07ef0724cb752de6c"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Film_FilmDetails), @"mvc.1.0.view", @"/Views/Film/FilmDetails.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\_ViewImports.cshtml"
using onlineCinema;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\_ViewImports.cshtml"
using onlineCinema.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"e6a8ce4f693ad321cd6904e07ef0724cb752de6c", @"/Views/Film/FilmDetails.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1a57ad66f004287c0b80b59cb83e5b7f5e0f98b6", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Film_FilmDetails : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<FilmModel>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n<h1>Подробности фильма</h1>\r\n\r\n<div>\r\n    <h4>Название:</h4>\r\n    <p>");
#nullable restore
#line 7 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Оригинальное название:</h4>\r\n    <p>");
#nullable restore
#line 12 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.OriginalTitle);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Слоган:</h4>\r\n    <p>");
#nullable restore
#line 17 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Tagline);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Дата выхода:</h4>\r\n    <p>");
#nullable restore
#line 22 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.ReleaseDate.ToShortDateString());

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Рейтинг:</h4>\r\n    <p>");
#nullable restore
#line 27 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Rating);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Бюджет:</h4>\r\n    <p>");
#nullable restore
#line 32 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Budget);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Рейтинг MPAA:</h4>\r\n    <p>");
#nullable restore
#line 37 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.MpaaRating);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Описание:</h4>\r\n    <p>");
#nullable restore
#line 42 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Description);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Язык:</h4>\r\n    <p>");
#nullable restore
#line 47 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Language.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Продолжительность:</h4>\r\n    <p>");
#nullable restore
#line 52 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
  Write(Model.Duration.TimeOfDay);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div>\r\n    <h4>Актеры:</h4>\r\n    <ul>\r\n");
#nullable restore
#line 58 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
         foreach (var actor in Model.Actors)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li>");
#nullable restore
#line 60 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
           Write(actor.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</li>\r\n");
#nullable restore
#line 61 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </ul>\r\n</div>\r\n\r\n<div>\r\n    <h4>Жанры:</h4>\r\n    <ul>\r\n");
#nullable restore
#line 68 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
         foreach (var genre in Model.Genres)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li>");
#nullable restore
#line 70 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
           Write(genre);

#line default
#line hidden
#nullable disable
            WriteLiteral("</li>\r\n");
#nullable restore
#line 71 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </ul>\r\n</div>\r\n\r\n<div>\r\n    <h4>Страны:</h4>\r\n    <ul>\r\n");
#nullable restore
#line 78 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
         foreach (var country in Model.Countries)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li>");
#nullable restore
#line 80 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
           Write(country);

#line default
#line hidden
#nullable disable
            WriteLiteral("</li>\r\n");
#nullable restore
#line 81 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </ul>\r\n</div>\r\n\r\n<div>\r\n    <h4>Режиссеры:</h4>\r\n    <ul>\r\n");
#nullable restore
#line 88 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
         foreach (var director in Model.Directors)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li>");
#nullable restore
#line 90 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
           Write(director);

#line default
#line hidden
#nullable disable
            WriteLiteral("</li>\r\n");
#nullable restore
#line 91 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </ul>\r\n</div>\r\n\r\n<div>\r\n    <h4>Студии:</h4>\r\n    <ul>\r\n");
#nullable restore
#line 98 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
         foreach (var company in Model.Companies)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li>");
#nullable restore
#line 100 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
           Write(company);

#line default
#line hidden
#nullable disable
            WriteLiteral("</li>\r\n");
#nullable restore
#line 101 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </ul>\r\n</div>\r\n\r\n<div>\r\n    <h4>Сценаристы:</h4>\r\n    <ul>\r\n");
#nullable restore
#line 108 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
         foreach (var scriptwriter in Model.Scriptwriters)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li>");
#nullable restore
#line 110 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
           Write(scriptwriter);

#line default
#line hidden
#nullable disable
            WriteLiteral("</li>\r\n");
#nullable restore
#line 111 "C:\учеба\4 семестр\бд\DB_course_work\onlineCinema\onlineCinema\Views\Film\FilmDetails.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </ul>\r\n</div>\r\n\r\n<a href=\"/Film/Films\" class=\"btn btn-secondary\">Назад</a>");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<FilmModel> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
